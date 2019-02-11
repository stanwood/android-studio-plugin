package ${kotlinEscapedPackageName}.repository.${apiFolderName}

import com.nytimes.android.external.fs3.SourcePersisterFactory
import com.nytimes.android.external.fs3.filesystem.FileSystem
import com.nytimes.android.external.store3.base.Parser
import com.nytimes.android.external.store3.base.impl.BarCode
import com.nytimes.android.external.store3.base.impl.MemoryPolicy
import com.nytimes.android.external.store3.base.impl.StoreBuilder
import io.reactivex.Single
import io.stanwood.framework.arch.core.Resource
import io.stanwood.framework.arch.core.rx.ResourceTransformer
import io.stanwood.framework.network.store.SerializationParserFactory
import ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}.${apiClassName}
import ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}.${apiModelClassName}
import kotlinx.serialization.list
import okio.BufferedSource
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

@Suppress("UnstableApiUsage")
@Singleton
class ${repositoryClassName} @Inject constructor(private val api: ${apiClassName}, fileSystem: FileSystem) {
    companion object {
        private val all${modelClassName} = BarCode("${modelClassName}", "all")
    }

    private val sourcePersister = SourcePersisterFactory.create(fileSystem, 60, TimeUnit.MINUTES)
    private val memoryPolicy = MemoryPolicy.builder().setExpireAfterWrite(30).setExpireAfterTimeUnit(TimeUnit.MINUTES).build()
    private val sampleStore by lazy {
        SerializationParserFactory.createSourceParser(${apiModelClassName}.serializer().list)
            .fetchFrom { api.fetch${modelClassName}() }
            .open()
    }

    fun fetch${modelClassName}(): Single<Resource<List<${modelClassName}>>> =
        sampleStore.get(all${modelClassName})
            .compose(ResourceTransformer.fromSingle({ src -> src.map { it.mapToDomain() } }))


    private fun <T> Parser<BufferedSource, T>.fetchFrom(fetcher: (BarCode) -> Single<BufferedSource>) =
        StoreBuilder.parsedWithKey<BarCode, BufferedSource, T>()
            .fetcher(fetcher)
            .persister(sourcePersister)
            .refreshOnStale()
            .memoryPolicy(memoryPolicy)
            .parser(this)
}