package ${escapeKotlinIdentifiers(packageName)}.loader

import io.reactivex.Observable

interface ${loaderName} {
    val data: Observable<List<String>>
}