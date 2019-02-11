package ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}
import io.reactivex.Single
import okio.BufferedSource
import retrofit2.http.GET

interface ${apiClassName} {
    // TODO: Change path
    @GET("repositories")
    fun fetch${modelClassName}(): Single<BufferedSource>
}