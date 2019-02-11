package ${kotlinEscapedPackageName}

import android.app.Activity
import android.app.Application
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.HasActivityInjector
import ${kotlinEscapedPackageName}.di.DaggerAppComponent
import javax.inject.Inject
import timber.log.Timber

class ${className} : Application(), HasActivityInjector {

    @Inject
    lateinit var activityInjector: DispatchingAndroidInjector<Activity>

    override fun activityInjector(): AndroidInjector<Activity> = activityInjector

    override fun onCreate() {
        super.onCreate()
        //TODO: When using Stanwood Analytics, replace this with Analytics initialization
        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }        
        DaggerAppComponent.builder().application(this).build().inject(this)
    }
}