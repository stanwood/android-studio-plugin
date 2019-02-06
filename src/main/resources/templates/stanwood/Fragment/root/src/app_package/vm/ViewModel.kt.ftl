package ${escapeKotlinIdentifiers(packageName)}.vm

import  ${escapeKotlinIdentifiers(packageName)}.loader.${loaderName}
import io.stanwood.architecture.RealViewModel
<#if canNavigate>
import io.reactivex.subjects.PublishSubject
import io.stanwood.architecture.NavigationTarget
</#if>
<#if fragmentLayoutType == 'list'>
import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
</#if>
import javax.inject.Inject

class ${viewModelName} @Inject constructor(val loader: ${loaderName}) : RealViewModel {
<#if canNavigate>
    private val navigation = PublishSubject.create<NavigationTarget>()
    val navigator = navigation.firstElement()
</#if>
<#if fragmentLayoutType == 'list'>    
    val items: Observable<List<${itemViewModelName}>> = loader.data.map { list -> list.map { ${itemViewModelName}(<#if itemLayoutType == 'simple'>"Title $it"<#else>"Title $it", "Subtitle $it", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmtR0UO-4S6W3YhU96Lt-BY1plpfWNQ7HXh2S9hFWit460fhur"</#if>) } }
                                                            .observeOn(AndroidSchedulers.mainThread())
</#if>        
    fun destroy() {
    }
}