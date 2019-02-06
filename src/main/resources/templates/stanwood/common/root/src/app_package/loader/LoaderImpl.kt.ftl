package ${escapeKotlinIdentifiers(packageName)}.loader

import io.stanwood.architecture.Loader
import javax.inject.Inject

class ${loaderName}Impl @Inject constructor() : Loader(), ${loaderName} {
    override fun onCleared() {
        super.onCleared()
    }
}