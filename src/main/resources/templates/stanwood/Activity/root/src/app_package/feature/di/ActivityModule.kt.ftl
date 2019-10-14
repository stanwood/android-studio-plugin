package ${kotlinEscapedPackageName}.di

import dagger.Module
import dagger.android.ContributesAndroidInjector
import io.stanwood.framework.arch.di.module.ActivityModule
import ${kotlinEscapedPackageName}.ui.${activityClass}
<#if useDataProvider>	
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProviders
import dagger.Provides
import io.stanwood.framework.arch.di.factory.ViewDataProviderFactory
import io.stanwood.framework.arch.di.scope.ActivityScope
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}Impl
</#if>

@Module(includes = [${activityClass}SubModule::class])
abstract class ${activityClass}Module : ActivityModule<${activityClass}>() {
// TODO : Provide Fragments created by this Activity
}

@Module
object ${activityClass}SubModule {
<#if useDataProvider>	
    @Provides
    @ActivityScope
    @JvmStatic
    internal fun provide${dataProviderName}(
        activity: AppCompatActivity,
        dataProviderFactory: ViewDataProviderFactory<${dataProviderName}Impl>
    ): ${dataProviderName} =
        ViewModelProviders.of(activity, dataProviderFactory).get(${dataProviderName}Impl::class.java)
</#if>
}