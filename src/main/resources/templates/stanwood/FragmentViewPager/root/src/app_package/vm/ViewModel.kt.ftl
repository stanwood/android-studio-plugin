package ${kotlinEscapedPackageName}.vm

<#if useDataProvider!false>
import  ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
</#if>
import io.stanwood.framework.arch.core.ViewModel
<#if canNavigate>
import io.reactivex.subjects.PublishSubject
import io.stanwood.framework.arch.nav.NavigationTarget
</#if>
import javax.inject.Inject

class ${viewModelName} @Inject constructor(<#if useDataProvider!false>private val dataProvider: ${dataProviderName}</#if>) : ViewModel {
<#if canNavigate>
    private val navigation = PublishSubject.create<NavigationTarget>()
    val navigator = navigation.firstElement()
</#if>
    fun destroy() {
    }
}