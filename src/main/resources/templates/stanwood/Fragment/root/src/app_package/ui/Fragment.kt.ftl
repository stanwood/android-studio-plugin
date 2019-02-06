<#assign bindingClass = underscoreToCamelCase(layoutName) + 'Binding'>
package ${escapeKotlinIdentifiers(packageName)}.ui

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
import ${escapeKotlinIdentifiers(applicationPackage)}.databinding.${bindingClass}
<#if useVm>
import io.stanwood.architecture.RealViewModelFactory
import ${escapeKotlinIdentifiers(packageName)}.vm.${viewModelName}
</#if>
<#if canNavigate>
import androidx.navigation.fragment.findNavController
</#if>
<#if canNavigate || fragmentLayoutType == 'list'>
import io.stanwood.architecture.subscribeBy
</#if>
<#if fragmentLayoutType == 'list'>
import androidx.recyclerview.widget.LinearLayoutManager
</#if>
import javax.inject.Inject

class ${className} : Fragment(), HasSupportFragmentInjector {

<#if useVm>
    @Inject
    internal lateinit var viewModelFactory: RealViewModelFactory<${viewModelName}>
    private var viewModel: ${viewModelName}? = null
</#if>
    @Inject
    internal lateinit var androidInjector: DispatchingAndroidInjector<Fragment>
<#if useGlide>
    @Inject
    internal lateinit var dataBindingComponent: DataBindingComponent
</#if>
    private var binding: ${underscoreToCamelCase(layoutName)}Binding? = null
<#if fragmentLayoutType == 'list'>

    private var rcvAdapter : ${adapterName}? = null
</#if>

    override fun supportFragmentInjector() = androidInjector

    override fun onCreate(savedInstanceState: Bundle?) {
        AndroidSupportInjection.inject(this)
        super.onCreate(savedInstanceState)
        viewModel = viewModelFactory.create(${viewModelName}::class.java)
    }

    override fun onCreateView(inflater: LayoutInflater,container: ViewGroup?,savedInstanceState: Bundle?) =
         ${bindingClass}.inflate(inflater, container, false<#if useGlide>, dataBindingComponent</#if>)
        .apply {
            binding = this
        }.root
<#if useVm>
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    view.requestApplyInsets()
<#if canNavigate || fragmentLayoutType == 'list'>
    <#if fragmentLayoutType == 'list'>
        rcvAdapter = ${adapterName}(LayoutInflater.from(context)<#if useGlide>, dataBindingComponent</#if>)
    </#if>
        binding?.apply {
            <#if fragmentLayoutType == 'list'>
            rcv?.apply {
                setHasFixedSize(true)
                layoutManager = LinearLayoutManager(context)           
            }
            </#if>
            setLifecycleOwner(this@${className})
        }
        viewModel.apply {
    <#if canNavigate>
                navigator.subscribeBy(viewLifecycleOwner.lifecycle, onSuccess = { findNavController().navigate(it.navDirections, it.navOptions) })
    </#if>
    <#if fragmentLayoutType == 'list'>
                items.subscribeBy(viewLifecycleOwner.lifecycle, onNext = {
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
            }
</#if>
    }

    override fun onDestroyView() {
        super.onDestroyView()
        viewModel?.destroy()
    }
</#if>
}