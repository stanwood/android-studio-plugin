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
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
import io.stanwood.framework.arch.core.rx.subscribeBy
</#if>
import javax.inject.Inject

class ${className} : Fragment(), HasAndroidInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private lateinit var viewModel: ${viewModelName}
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Any>

    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    override fun androidInjector(): AndroidInjector<Any> = androidInjector

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
        navigationAction.subscribeBy(viewLifecycleOwner, onSuccess = { it.navigate(findNavController()) })
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