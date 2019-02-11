<recipe folder="root://stanwood/common">
    <dependency mavenUrl="androidx.appcompat:appcompat:${versionAppCompat}"/>
    <dependency mavenUrl="com.github.stanwood.framework-arch-android:di:${versionArchFramework}"/>
<#if canNavigate>
	<dependency mavenUrl="com.github.stanwood.framework-arch-android:nav:${versionArchFramework}"/>
</#if>
	<instantiate from="root/src/app_package/di/FragmentModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${className}Module.kt" />

	<instantiate from="root/src/app_package/di/FragmentSubModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${className}SubModule.kt" />

	<#include "root://stanwood/common/recipe_dataprovider.xml.ftl" />
    <#include "root://stanwood/common/recipe_toolbar.xml.ftl" />
</recipe>