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
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
import io.stanwood.framework.arch.core.rx.subscribeBy
import io.stanwood.framework.arch.nav.Back
import io.stanwood.framework.arch.nav.Direction
import io.stanwood.framework.arch.nav.Up
</#if>
import javax.inject.Inject

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

    private var pagerAdapter: ${adapterName}? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        AndroidSupportInjection.inject(this)
        super.onCreate(savedInstanceState)
        <#if useVm>        
        viewModel = viewModelFactory.create(${viewModelName}::class.java)
        </#if>
    }

    override fun onCreateView(inflater: LayoutInflater,container: ViewGroup?,savedInstanceState: Bundle?) =
         ${bindingClass}.inflate(inflater, container, false)
        .apply {
            binding = this
        }.root

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    view.requestApplyInsets()
    binding?.apply {
        lifecycleOwner = viewLifecycleOwner
        pagerAdapter = ${adapterName}(childFragmentManager, requireContext())
        pager.adapter = pagerAdapter
<#if useTabLayout>        
        tabLayout.setupWithViewPager(pager)
</#if>
        }    
    <#if canNavigate>
    viewModel.apply {
            navigator.subscribeBy(viewLifecycleOwner, onSuccess = {
                when (it) {
                    is Direction -> childNavController?.navigate(it.navDirections, it.navOptions)
                    is Back -> childNavController?.popBackStack()
                    is Up -> childNavController?.navigateUp()
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