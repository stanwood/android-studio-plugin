<#assign bindingClass = underscoreToCamelCase(itemLayoutName) + 'Binding'>
package ${escapeKotlinIdentifiers(packageName)}.ui

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
<#if useGlide>
import androidx.databinding.DataBindingComponent
</#if>
import io.stanwood.architecture.BindingViewHolder
import ${escapeKotlinIdentifiers(applicationPackage)}.BR
import ${escapeKotlinIdentifiers(applicationPackage)}.databinding.${bindingClass}
import ${escapeKotlinIdentifiers(packageName)}.vm.${itemViewModelName}

class ${adapterName}(private val inflater: LayoutInflater<#if useGlide>, private val dataBindingComponent: DataBindingComponent</#if>) :
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
        BindingViewHolder(${bindingClass}.inflate(inflater, parent, false<#if useGlide>, dataBindingComponent</#if>))		
<#if itemLayoutType == 'simple'>

    override fun onBindViewHolder(holder: BindingViewHolder, position: Int) {
        holder.binding.apply {
            setVariable(BR.vm, getItem(position))
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
            }
            executePendingBindings()
        }
    }
</#if>	
}