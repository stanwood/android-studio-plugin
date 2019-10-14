<#assign bindingClass = underscoreToCamelCase(layoutName) + 'Binding'>
package ${kotlinEscapedPackageName}.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
<#if useGlide>
import androidx.databinding.DataBindingComponent
import androidx.databinding.DataBindingUtil
import ${kotlinEscapedAppPackageName}.R
</#if>
import androidx.fragment.app.Fragment
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.support.AndroidSupportInjection
import dagger.android.HasAndroidInjector
import ${kotlinEscapedAppPackageName}.databinding.${bindingClass}
<#if useVm>
import io.stanwood.framework.arch.di.factory.ViewModelFactory
import ${kotlinEscapedPackageName}.vm.${viewModelName}
import io.stanwood.framework.arch.core.rx.subscribeBy
</#if>
<#if isClickableItem>
import ${kotlinEscapedPackageName}.vm.${viewModelName}ActionListener
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
</#if>
import androidx.recyclerview.widget.LinearLayoutManager
import javax.inject.Inject

class ${className} : Fragment(), HasAndroidInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: ViewModelFactory<${viewModelName}>
    private lateinit var viewModel: ${viewModelName}
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Any>
<#if useGlide>
    @Inject
    internal lateinit var dataBindingComponent: DataBindingComponent
    
</#if>
    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null

    private var rcvAdapter : ${adapterName}? = null

    override fun androidInjector(): AndroidInjector<Any> = androidInjector

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
        }.root

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    binding?.apply {
            rcv.apply {
                setHasFixedSize(true)
                layoutManager = LinearLayoutManager(context)           
            }
            lifecycleOwner = viewLifecycleOwner
        }
    rcvAdapter = ${adapterName}(LayoutInflater.from(context)<#if useGlide>, dataBindingComponent</#if><#if isClickableItem> , viewModel</#if>)
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
                navigationAction.subscribeBy(viewLifecycleOwner, onSuccess = { it.navigate(findNavController()) })
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