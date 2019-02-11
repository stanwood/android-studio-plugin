package ${kotlinEscapedPackageName}.dataprovider

import io.reactivex.Observable

interface ${dataProviderName} {
    val data: Observable<List<String>>
}