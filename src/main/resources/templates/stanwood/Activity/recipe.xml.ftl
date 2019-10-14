<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
	<dependency mavenUrl="androidx.appcompat:appcompat:${versionAppCompat}"/>
<#if isNavHost>
    <apply plugin="androidx.navigation.safeargs" />
    <dependency mavenUrl="com.github.stanwood.framework-arch-android:nav:${versionArchFramework}"/>
    <instantiate from="root/res/layout/activity_navigation_host.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/feature/ui/NavigationHostActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.kt" />

	<instantiate from="root/res/navigation/nav_graph.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/navigation/${navGraphName}.xml" />
    <merge from="root/root.gradle.ftl"
           to="${escapeXmlAttribute(topOut)}/build.gradle" />
<#else>
    <instantiate from="root/res/layout/activity_simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/feature/ui/SimpleActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.kt" />
</#if>

	<instantiate from="root/src/app_package/feature/di/ActivityModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${activityClass}Module.kt" />

	<merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	<#include "root://stanwood/common/recipe_dataprovider.xml.ftl" />
</recipe>