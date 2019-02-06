package ${escapeKotlinIdentifiers(packageName)}.loader

import io.reactivex.Observable
import io.reactivex.disposables.CompositeDisposable
import io.stanwood.architecture.Loader
import javax.inject.Inject

class ${loaderName}Impl @Inject constructor() : Loader(), ${loaderName} {

    private var disposable: CompositeDisposable = CompositeDisposable()
    override val data = Observable.just(List(50) { "$it" })
        .replay(1)
        .autoConnect(1) { disposable.add(it) }

    override fun onCleared() {
        super.onCleared()
        disposable.dispose()
    }
}