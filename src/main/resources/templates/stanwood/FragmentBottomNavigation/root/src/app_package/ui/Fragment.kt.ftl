<#assign bindingClass = underscoreToCamelCase(layoutName) + 'Binding'>
package ${kotlinEscapedPackageName}.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.support.AndroidSupportInjection
import dagger.android.HasAndroidInjector
import ${kotlinEscapedAppPackageName}.databinding.${bindingClass}
import io.stanwood.framework.ui.extensions.setApplyWindowInsetsToChild
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
import androidx.navigation.fragment.findNavController
import io.stanwood.framework.arch.core.rx.subscribeBy
import io.stanwood.framework.arch.nav.syncWith
</#if>
<#if useGlide!false>
import androidx.databinding.DataBindingComponent
import androidx.databinding.DataBindingUtil
</#if>
import javax.inject.Inject
<#if applicationPackage??>
import ${kotlinEscapedAppPackageName}.R
</#if>

class ${className} : Fragment(), HasAndroidInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private lateinit var viewModel: ${viewModelName}
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Any>
<#if useGlide!false>

    @Inject
    internal lateinit var dataBindingComponent: DataBindingComponent
</#if>

    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    override fun androidInjector(): AndroidInjector<Any> = androidInjector

    private val childNavController
        get() = childFragmentManager.findFragmentById(R.id.nav_host_child_fragment)?.findNavController()

    override fun onCreate(savedInstanceState: Bundle?) {
        AndroidSupportInjection.inject(this)
        super.onCreate(savedInstanceState)
<#if useVm>        
        viewModel = viewModelFactory.create(${viewModelName}::class.java)
</#if>
    }

    override fun onCreateView(inflater: LayoutInflater,container: ViewGroup?,savedInstanceState: Bundle?) =
    <#if useGlide!false>
        DataBindingUtil.inflate<${bindingClass}>(inflater, R.layout.${layoutName}, container, false, dataBindingComponent)
    <#else>
         ${bindingClass}.inflate(inflater, container, false)
    </#if>
        .apply {
            binding = this
            root.setApplyWindowInsetsToChild()
            childNavController?.let {
                binding?.bottomNav?.syncWith(it, lifecycle)
            }
        }.root

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    binding?.lifecycleOwner = viewLifecycleOwner
    <#if useVm>
    binding?.setNavSelectedListener { menuItem ->
        binding?.bottomNav?.selectedItemId?.let {
            viewModel.selectMenuItem(menuItem.itemId, it)
        } ?: false
    }    
    viewModel.apply {
            navigationAction.subscribeBy(viewLifecycleOwner, onNext = {
                childNavController?.let { navController ->
                    it.navigate(navController)
                }
            })
        }
    </#if>
    }
<#if useVm>

    override fun onDestroyView() {
        super.onDestroyView()
        viewModel.destroy()
    }
</#if>
}