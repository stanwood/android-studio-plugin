package ${escapeKotlinIdentifiers(packageName)}.di

import dagger.Module
<#if useLoader>	
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProviders
import dagger.Provides
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import io.stanwood.framework.arch.di.scope.ActivityScope
import ${escapeKotlinIdentifiers(packageName)}.loader.${loaderName}
import ${escapeKotlinIdentifiers(packageName)}.loader.${loaderName}Impl
</#if>

@Module
class ${activityClass}SubModule {

    // provide activity stuff with @ActivityScope here
	
	<#if useLoader>	
    @Provides
    @ActivityScope
    internal fun provide${loaderName}(
        activity: AppCompatActivity,
        viewModelFactory: ViewModelFactory<${loaderName}Impl>
    ): ${loaderName} =
        ViewModelProviders.of(activity, viewModelFactory).get(${loaderName}Impl::class.java)
</#if>
}