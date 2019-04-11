<#assign bindingClass = underscoreToCamelCase(layoutName) + 'Binding'>
package ${kotlinEscapedPackageName}.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import dagger.android.DispatchingAndroidInjector
import dagger.android.support.AndroidSupportInjection
import dagger.android.support.HasSupportFragmentInjector
import ${kotlinEscapedAppPackageName}.databinding.${bindingClass}
import io.stanwood.framework.ui.extensions.setApplyWindowInsetsToChild
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
import androidx.navigation.fragment.findNavController
import io.stanwood.framework.arch.core.rx.subscribeBy
</#if>
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${className} : Fragment(), HasSupportFragmentInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private lateinit var viewModel: ${viewModelName}
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Fragment>

    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    override fun supportFragmentInjector() = androidInjector

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
         ${bindingClass}.inflate(inflater, container, false<#if useGlide!false>, dataBindingComponent</#if>)
        .apply {
            binding = this
            root.setApplyWindowInsetsToChild()
            childNavController?.let {
                bottomNav.setupWithNavController(it)
            }
        }.root

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    view.requestApplyInsets()
    binding?.lifecycleOwner = viewLifecycleOwner
    <#if useVm>
    viewModel.apply {
            navigator.subscribeBy(viewLifecycleOwner, onNext = {
                childNavController?.navigate(it.navDirections, it.navOptions)
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