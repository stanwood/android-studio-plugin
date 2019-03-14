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
import io.stanwood.framework.arch.core.rx.subscribeBy
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
</#if>
import androidx.recyclerview.widget.LinearLayoutManager
import javax.inject.Inject

class ${className} : Fragment(), HasSupportFragmentInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private lateinit var viewModel: ${viewModelName}
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Fragment>
<#if useGlide>
    @Inject
    internal lateinit var dataBindingComponent: DataBindingComponent
    
</#if>
    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    private var rcvAdapter : ${adapterName}? = null

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
    binding?.apply {
            rcv.apply {
                setHasFixedSize(true)
                layoutManager = LinearLayoutManager(context)           
            }
            lifecycleOwner = viewLifecycleOwner
        }
    rcvAdapter = ${adapterName}(LayoutInflater.from(context)<#if useGlide>, dataBindingComponent</#if>)<#if isClickableItem> { <#if useVm>viewModel?.itemClicked(it)<#else>/*TODO: Add click handling*/</#if> } </#if>
    <#if useVm>
        viewModel.apply {
        <#if useDataProvider!false>            
                items.subscribeBy(viewLifecycleOwner, onNext = {
                    binding?.rcv?.apply {
                        rcvAdapter?.apply {
                            if (adapter == null) {
                                adapter = this
                            }
                            submitList(it)
                        }
                    }
                })
        </#if>                
        <#if canNavigate>
                navigator.subscribeBy(viewLifecycleOwner, onSuccess = { findNavController().navigate(it.navDirections, it.navOptions) })
        </#if>
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