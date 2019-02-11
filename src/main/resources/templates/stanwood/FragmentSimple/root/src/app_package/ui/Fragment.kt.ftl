<#assign bindingClass = underscoreToCamelCase(layoutName) + 'Binding'>
package ${kotlinEscapedPackageName}.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
<#if useGlide>
import androidx.databinding.DataBindingComponent
</#if>
import androidx.fragment.app.Fragment
import dagger.android.DispatchingAndroidInjector
import dagger.android.support.AndroidSupportInjection
import dagger.android.support.HasSupportFragmentInjector
import ${kotlinEscapedAppPackageName}.databinding.${bindingClass}
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
import io.stanwood.framework.arch.core.rx.subscribeBy
</#if>
import javax.inject.Inject

class ${className} : Fragment(), HasSupportFragmentInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private var viewModel: ${viewModelName}? = null
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Fragment>
<#if useGlide>
    @Inject
    internal lateinit var dataBindingComponent: DataBindingComponent
</#if>
    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    override fun supportFragmentInjector() = androidInjector

    override fun onCreate(savedInstanceState: Bundle?) {
        AndroidSupportInjection.inject(this)
        super.onCreate(savedInstanceState)
        <#if useVm>        
        viewModel = viewModelFactory.create(${viewModelName}::class.java)
        </#if>
    }

    override fun onCreateView(inflater: LayoutInflater,container: ViewGroup?,savedInstanceState: Bundle?) =
         ${bindingClass}.inflate(inflater, container, false<#if useGlide>, dataBindingComponent</#if>)
        .apply {
            binding = this
        }.root

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    view.requestApplyInsets()
    binding?.lifecycleOwner = viewLifecycleOwner
    <#if canNavigate>
    viewModel?.apply {
            navigator.subscribeBy(viewLifecycleOwner, onSuccess = { findNavController().navigate(it.navDirections, it.navOptions) })
            }
    </#if>
    }
<#if useVm>
    override fun onDestroyView() {
        super.onDestroyView()
        viewModel?.destroy()
    }
</#if>
}