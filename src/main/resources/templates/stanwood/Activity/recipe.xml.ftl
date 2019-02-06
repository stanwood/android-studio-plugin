<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
	 <dependency mavenUrl="androidx.appcompat:appcompat:1.+"/>
	<dependency mavenUrl="android.arch.navigation:navigation-fragment-ktx:+" />
	<dependency mavenUrl="android.arch.navigation:navigation-ui-ktx:+" />
	<dependency mavenUrl="android.arch.navigation:navigation-ui-ktx:+" />

<#if isNavHost>
    <instantiate from="root/res/layout/activity_navigation_host.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/feature/ui/NavigationHostActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.kt" />

	<instantiate from="root/res/navigation/nav_graph.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/navigation/${navGraphName}.xml" />

<#else>
    <instantiate from="root/res/layout/activity_simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/feature/ui/SimpleActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.kt" />
</#if>

	<instantiate from="root/src/app_package/feature/di/ActivityModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${activityClass}Module.kt" />

	<instantiate from="root/src/app_package/feature/di/ActivitySubModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${activityClass}SubModule.kt" />

	<merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

<#if useLoader>
	<#include "root://stanwood/common/recipe_loader.xml.ftl" />
</#if>
</recipe>
