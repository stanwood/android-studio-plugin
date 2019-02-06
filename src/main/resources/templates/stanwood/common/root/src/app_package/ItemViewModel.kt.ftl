package ${escapeKotlinIdentifiers(packageName)}<#if itemCreatePackage!false>.vm</#if>
<#if isSelectable || isDisableable>

import androidx.databinding.BaseObservable
import androidx.databinding.Bindable
import ${escapeKotlinIdentifiers(applicationPackage)}.BR
</#if>

class ${itemViewModelName} <#if itemLayoutType == 'simple'>(val title: String)<#else>(val title: String, val subtitle: String, val imageUrl: String)</#if><#if isSelectable || isDisableable> : BaseObservable()</#if> {
<#if isSelectable>
    var isSelected: Boolean = false
        @Bindable get
        set(value) {
            if (field != value) {
                field = value
            }
            notifyPropertyChanged(BR.selected)
        }
</#if>        
<#if isDisableable>
    var isEnabled: Boolean = false
        @Bindable get
        set(value) {
            if (field != value) {
                field = value
            }
            notifyPropertyChanged(BR.enabled)
        }
</#if>
}