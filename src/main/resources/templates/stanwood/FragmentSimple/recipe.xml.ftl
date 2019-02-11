<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <#include "root://stanwood/common/recipe_fragment.xml.ftl" />
    <instantiate from="root/src/app_package/ui/Fragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className}.kt" />
	<instantiate from="root/res/layout/fragment.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />
<#if useVm>
	<instantiate from="root/src/app_package/vm/ViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/vm/${viewModelName}.kt" />
</#if>
</recipe>