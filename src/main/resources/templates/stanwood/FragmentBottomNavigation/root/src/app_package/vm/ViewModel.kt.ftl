package ${kotlinEscapedPackageName}.vm

<#if useDataProvider!false>
import  ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
</#if>
import androidx.annotation.IdRes
import io.stanwood.framework.arch.core.ViewModel
import io.reactivex.subjects.PublishSubject
import io.stanwood.framework.arch.nav.NavigationTarget
import io.reactivex.Observable
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${viewModelName} @Inject constructor(<#if useDataProvider!false>private val dataProvider: ${dataProviderName}</#if>) : ViewModel {
    private val navigation = PublishSubject.create<NavigationTarget>()
    val navigator: Observable<NavigationTarget> = navigation

    fun destroy() {
    }
}