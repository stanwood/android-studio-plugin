<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <#include "root://stanwood/common/recipe_fragment.xml.ftl" />
    <dependency mavenUrl="com.google.android.material:material:${versionMaterial}" />
    <dependency mavenUrl="com.github.stanwood.framework-core-android:ui:${versionCoreFramework}"/>
    <instantiate from="root/src/app_package/ui/Fragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className}.kt" />
	<instantiate from="root/res/layout/fragment.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />
    <instantiate from="root/res/menu/menu.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/menu/${escapeXmlAttribute(menuName)}.xml" />
	<instantiate from="root/res/navigation/nav_graph.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/navigation/${navGraphName}.xml" />
    <merge from="root/res/values/strings.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/strings.xml" />                   
<#if useVm>
	<instantiate from="root/src/app_package/vm/ViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/vm/${viewModelName}.kt" />
</#if>
</recipe>