package ${kotlinEscapedPackageName}.dataprovider

import io.reactivex.Observable
import io.reactivex.disposables.CompositeDisposable
import io.stanwood.framework.arch.core.ViewDataProvider
import javax.inject.Inject
import io.reactivex.rxkotlin.plusAssign

class ${dataProviderName}Impl @Inject constructor() : ViewDataProvider(), ${dataProviderName} {

    private var disposable: CompositeDisposable = CompositeDisposable()
    override val data = Observable.just(List(50) { "$it" })
        .replay(1)
        .autoConnect(1) { disposable += it }

    override fun onCleared() {
        super.onCleared()
        disposable.dispose()
    }
}