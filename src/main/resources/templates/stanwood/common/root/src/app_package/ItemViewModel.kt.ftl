package ${kotlinEscapedPackageName}<#if itemCreatePackage!false>.vm</#if>

class ${itemViewModelName} <#if itemLayoutType == 'simple'>(val title: String)<#else>(val title: String, val subtitle: String, val imageUrl: String)</#if>