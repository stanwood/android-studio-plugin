package ${kotlinEscapedPackageName}.vm

<#if useDataProvider!false>
import  ${kotlinEscapedPackageName}.dataprovider.${dataProviderName}
</#if>
import androidx.annotation.IdRes
import io.stanwood.framework.arch.core.ViewModel
import io.reactivex.subjects.PublishSubject
import io.stanwood.framework.arch.nav.Direction
import io.stanwood.framework.arch.nav.NavigationTarget
import io.reactivex.Observable
import javax.inject.Inject
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${viewModelName} @Inject constructor(<#if useDataProvider!false>private val dataProvider: ${dataProviderName}</#if>) : ViewModel {
    private val _navigationAction = PublishSubject.create<NavigationTarget>()
    val navigationAction: Observable<NavigationTarget> = _navigationAction
    
    fun selectMenuItem(@IdRes id: Int, @IdRes currentSelectedId: Int) =
        if (id == currentSelectedId) {
            true
        } else when (id) {
            // TODO: Setup bottom navigation targets
            R.id.firstItem -> null
            R.id.secondItem -> null
            R.id.thirdItem -> null
            else -> null
        }
            ?.let {
                _navigationAction.onNext(Direction(it))
                true
            }
            ?: false

    fun destroy() {
    }
}