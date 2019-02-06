package ${escapeKotlinIdentifiers(packageName)}.di

import androidx.databinding.DataBindingComponent
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders
import dagger.Module
import dagger.Provides
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import io.stanwood.framework.arch.di.scope.FragmentScope
<#if useVm>	
import ${escapeKotlinIdentifiers(packageName)}.loader.${loaderName}
import ${escapeKotlinIdentifiers(packageName)}.loader.${loaderName}Impl
</#if>
<#if useGlide>	
import ${escapeKotlinIdentifiers(applicationPackage)}.glide.GlideAppFactory
import ${escapeKotlinIdentifiers(applicationPackage)}.glide.GlideAppFragmentFactory
import ${escapeKotlinIdentifiers(applicationPackage)}.glide.ImageViewBindingAdapters
</#if>
@Module
class ${className}SubModule {
<#if useGlide>	
    @Provides
    @FragmentScope
    internal fun provideGlideAppFragmentFactory(fragment: Fragment): GlideAppFactory =
        GlideAppFragmentFactory(fragment)

    @Provides
    @FragmentScope
    internal fun provideImageViewBindingAdapters(glideAppFactory: GlideAppFactory): ImageViewBindingAdapters =
        ImageViewBindingAdapters(glideAppFactory)
		
    @Provides
    @FragmentScope
    internal fun provideGlideDataBindingComponent(
        imageViewBindingAdapters: ImageViewBindingAdapters
    ): DataBindingComponent = object : DataBindingComponent {
        override fun getImageViewBindingAdapters(): ImageViewBindingAdapters =
            imageViewBindingAdapters
    }		
	
</#if>
<#if useVm>	
    @Provides
    @FragmentScope
    internal fun provide${loaderName}(
        fragment: Fragment,
        viewModelFactory: ViewModelFactory<${loaderName}Impl>
    ): ${loaderName} =
        ViewModelProviders.of(fragment, viewModelFactory).get(${loaderName}Impl::class.java)
</#if>
}