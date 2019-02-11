<recipe folder="root://stanwood/common">
<#if toolbarType??>
    <#if toolbarType != 'none'>
    <dependency mavenUrl="com.google.android.material:material:${versionMaterial}" />
    </#if>
    <#if toolbarType == 'parallax'>
    <dependency mavenUrl="com.github.stanwood.framework-core-android:ui:${versionCoreFramework}"/>
    </#if>
</#if>
</recipe>