package ${kotlinEscapedPackageName}.datasource

import android.app.Application
import com.nytimes.android.external.fs3.filesystem.FileSystem
import com.nytimes.android.external.fs3.filesystem.FileSystemFactory
import dagger.Module
import dagger.Provides
import io.reactivex.schedulers.Schedulers
import io.stanwood.debugapp.LoggingInterceptor
import io.stanwood.framework.network.interceptor.ConnectivityInterceptor
import io.stanwood.framework.network.retrofit.BufferedSourceConverterFactory
import ${kotlinEscapedPackageName}.BuildConfig
import ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}.${apiClassName}
import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import java.io.File
import java.io.IOException
import java.util.concurrent.TimeUnit
import javax.inject.Singleton

@Module
class NetworkModule {

    // TODO: Add this Module to your Dagger Application component

    @Provides
    @Singleton
    internal fun provideHttpClient(context: Application) =
        OkHttpClient.Builder().apply {
            addInterceptor(ConnectivityInterceptor(context))
            cache(File(context.cacheDir, "data")
                .let {
                    it.mkdirs()
                    Cache(it, 512 * 1024)
                })
            connectTimeout(10, TimeUnit.SECONDS)
            readTimeout(15, TimeUnit.SECONDS)
            if (BuildConfig.DEBUG) {
                addInterceptor(LoggingInterceptor(context, true))
            }
        }.build()

    @Singleton
    @Provides
    internal fun provideRetrofit(httpClient: OkHttpClient) =
        Retrofit.Builder().client(httpClient).baseUrl("https://api.github.com/") // TODO: Change base Url
            .addConverterFactory(BufferedSourceConverterFactory.create())
            .addCallAdapterFactory(RxJava2CallAdapterFactory.createWithScheduler(Schedulers.io()))
            .build()

    @Singleton
    @Provides
    internal fun provide${apiClassName}(retrofit: Retrofit) = retrofit.create(${apiClassName}::class.java)

    @Provides
    @Singleton
    fun provideFileSystem(context: Application): FileSystem =
        try {
            FileSystemFactory.create(File(context.noBackupFilesDir, "store"))
        } catch (e: IOException) {
            e.printStackTrace()
            throw e
        }
}