package ${kotlinEscapedPackageName}.dataprovider

import io.stanwood.framework.arch.core.ViewDataProvider
import javax.inject.Inject

class ${dataProviderName}Impl @Inject constructor() : ViewDataProvider(), ${dataProviderName} {
    override fun onCleared() {
        super.onCleared()
    }
}