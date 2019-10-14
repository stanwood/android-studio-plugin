<#assign bindingClass = underscoreToCamelCase(itemLayoutName) + 'Binding'>
package ${kotlinEscapedPackageName}.ui

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
<#if useGlide>
import androidx.databinding.DataBindingComponent
import androidx.databinding.DataBindingUtil
import ${kotlinEscapedAppPackageName}.R
</#if>
import io.stanwood.framework.databinding.recyclerview.BindingViewHolder
import ${kotlinEscapedAppPackageName}.BR
import ${kotlinEscapedAppPackageName}.databinding.${bindingClass}
import ${kotlinEscapedPackageName}.vm.${itemViewModelName}
<#if isClickableItem>
import ${kotlinEscapedPackageName}.vm.${viewModelName}ActionListener
</#if>

class ${adapterName}(private val inflater: LayoutInflater<#if useGlide>, private val dataBindingComponent: DataBindingComponent</#if><#if isClickableItem>, private val actionListener: ${viewModelName}ActionListener</#if>) :
    ListAdapter<${itemViewModelName}, BindingViewHolder>(
	     object : DiffUtil.ItemCallback<${itemViewModelName}>() {
<#if itemLayoutType == 'simple'>
            override fun areItemsTheSame(oldItem: ${itemViewModelName}, newItem: ${itemViewModelName}) =
				oldItem.title == newItem.title

            override fun areContentsTheSame(oldItem: ${itemViewModelName}, newItem: ${itemViewModelName}) =
				false
<#else>
            override fun areItemsTheSame(oldItem: ${itemViewModelName}, newItem: ${itemViewModelName}) =
                oldItem.title == newItem.title

            override fun areContentsTheSame(oldItem: ${itemViewModelName}, newItem: ${itemViewModelName}) =
                oldItem.title == newItem.title && oldItem.subtitle == newItem.subtitle && oldItem.imageUrl == newItem.imageUrl

            override fun getChangePayload(oldItem: ${itemViewModelName}, newItem: ${itemViewModelName}) =
                oldItem.imageUrl == newItem.imageUrl
</#if>
        }) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) =
    <#if useGlide!false>
        BindingViewHolder(DataBindingUtil.inflate<${bindingClass}>(inflater, R.layout.${itemLayoutName}, parent, false, dataBindingComponent)
    <#else>
        BindingViewHolder(${bindingClass}.inflate(inflater, container, false)
    </#if>)

<#if itemLayoutType == 'simple'>

    override fun onBindViewHolder(holder: BindingViewHolder, position: Int) {
        holder.binding.apply {
            setVariable(BR.vm, getItem(position))
            <#if isClickableItem>
            setVariable(BR.actionListener, actionListener)
            </#if>
            executePendingBindings()
        }
    }
<#else>

    override fun onBindViewHolder(holder: BindingViewHolder, position: Int, payloads: MutableList<Any>) {
        if (payloads.isEmpty() || payloads.any { it == true }) {
            super.onBindViewHolder(holder, position, payloads)
        } else {
            holder.binding.apply {
                setVariable(BR.imageUrl, getItem(position).imageUrl)
                executePendingBindings()
            }
        }
    }

    override fun onBindViewHolder(holder: BindingViewHolder, position: Int) {
        holder.binding.apply {
            getItem(position).also { item ->
                setVariable(BR.vm, item)
                setVariable(BR.imageUrl, item.imageUrl)
            <#if isClickableItem>
                setVariable(BR.actionListener, actionListener)
            </#if>
            }
            executePendingBindings()
        }
    }
</#if>
}