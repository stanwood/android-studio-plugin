package ${kotlinEscapedPackageName}.vm

<#if useDataProvider!false>
import  ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
</#if>
import io.stanwood.framework.arch.core.ViewModel
<#if canNavigate>
import io.reactivex.subjects.PublishSubject
import io.reactivex.Maybe
import io.stanwood.framework.arch.nav.NavigationTarget
</#if>
import javax.inject.Inject

class ${viewModelName} @Inject constructor(<#if useDataProvider!false>private val dataProvider: ${dataProviderName}</#if>) : ViewModel {
<#if canNavigate>
    private val _navigationAction = PublishSubject.create<NavigationTarget>()
    val navigationAction: Maybe<NavigationTarget> = _navigationAction.firstElement()
</#if>
    fun destroy() {
    }
}