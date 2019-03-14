package ${kotlinEscapedPackageName}.di

import dagger.Module
<#if useDataProvider>	
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProviders
import dagger.Provides
import io.stanwood.framework.arch.di.factory.ViewDataProviderFactory
import io.stanwood.framework.arch.di.scope.ActivityScope
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}Impl
</#if>

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