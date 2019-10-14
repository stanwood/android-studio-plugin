package ${kotlinEscapedPackageName}.vm
<#if useDataProvider!false>
import  ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
</#if>
import io.stanwood.framework.arch.core.ViewModel
<#if canNavigate>
import io.reactivex.subjects.PublishSubject
import io.reactivex.Maybe
import io.stanwood.framework.arch.nav.NavigationTarget
</#if>
import javax.inject.Inject

class ${viewModelName} @Inject constructor(<#if useDataProvider!false>private val dataProvider: ${dataProviderName}</#if>) : ViewModel<#if isClickableItem> , ${viewModelName}ActionListener </#if> {
<#if canNavigate>
    private val _navigationAction = PublishSubject.create<NavigationTarget>()
    val navigationAction: Maybe<NavigationTarget> = _navigationAction.firstElement()
</#if>
<#if useDataProvider!false>
    val items: Observable<List<${itemViewModelName}>> = dataProvider.data.map { list -> list.map { ${itemViewModelName}(<#if itemLayoutType == 'simple'>"Title $it"<#else>"Title $it", "Subtitle $it", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmtR0UO-4S6W3YhU96Lt-BY1plpfWNQ7HXh2S9hFWit460fhur"</#if>) } }
                                                            .observeOn(AndroidSchedulers.mainThread())
</#if>
<#if isClickableItem>

override fun show(item: ${itemViewModelName}){
        // TODO: Add click handling
    }
</#if>    

    fun destroy() {
    }
}