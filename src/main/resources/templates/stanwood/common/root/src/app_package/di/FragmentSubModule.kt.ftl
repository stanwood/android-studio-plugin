package ${kotlinEscapedPackageName}.di

import dagger.Module
import ${kotlinEscapedPackageName}.ui.${className}
import dagger.Provides
<#if useDataProvider!true>
import io.stanwood.framework.arch.di.factory.ViewDataProviderFactory
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
import ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}Impl
import androidx.lifecycle.ViewModelProviders
</#if>
<#if useGlide!false>
import ${kotlinEscapedAppPackageName}.glide.GlideAppFactory
import ${kotlinEscapedAppPackageName}.glide.GlideAppFragmentFactory
import ${kotlinEscapedAppPackageName}.glide.ImageViewBindingAdapters
import androidx.databinding.DataBindingComponent
</#if>
@Module
class ${className}SubModule {
<#if useGlide!false>
    @Provides
    internal fun provideGlideAppFragmentFactory(fragment: ${className}): GlideAppFactory =
        GlideAppFragmentFactory(fragment)

    @Provides
    internal fun provideImageViewBindingAdapters(glideAppFactory: GlideAppFactory): ImageViewBindingAdapters =
        ImageViewBindingAdapters(glideAppFactory)

    @Provides
    internal fun provideGlideDataBindingComponent(imageViewBindingAdapters: ImageViewBindingAdapters): DataBindingComponent =
     object : DataBindingComponent {
        override fun getImageViewBindingAdapters(): ImageViewBindingAdapters =
            imageViewBindingAdapters
    }
</#if>
<#if useDataProvider!true>

    @Provides
    internal fun provide${dataProviderName}(
        fragment: ${className},
        dataProviderFactory: ViewDataProviderFactory<${dataProviderName}Impl>
    ): ${dataProviderName} =
        ViewModelProviders.of(fragment, dataProviderFactory).get(${dataProviderName}Impl::class.java)
</#if>
}