<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="com.google.android.material:material:${versionMaterial}" />
    <dependency mavenUrl="com.jakewharton.timber:timber:${versionTimber}" />
    <dependency mavenUrl="com.github.stanwood.framework-arch-android:di:${versionArchFramework}" />
    <#if useGlide>
    <dependency mavenUrl="com.github.bumptech.glide:glide:${versionGlide}" />
    </#if>
    <apply plugin="kotlin-kapt" />
    <merge from="root/root.gradle.ftl"
           to="${escapeXmlAttribute(projectLocation)}/build.gradle" />
    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <instantiate from="root/SecurityAndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/../stage/AndroidManifest.xml" />
    <instantiate from="root/SecurityAndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/../debug/AndroidManifest.xml" />
    <instantiate from="root/res/xml/network_security_config.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/xml/network_security_config.xml" />
    <merge from="root/build.gradle.ftl"
           to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <merge from="root/res/values/styles.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <instantiate from="root/src/app_package/StanwoodApp.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}.kt" />
    <instantiate from="root/src/app_package/di/AppComponent.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/di/AppComponent.kt" />
    <instantiate from="root/src/app_package/di/AppModule.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/di/AppModule.kt" />
    <instantiate from="root/src/app_package/di/ActivityBuilderModule.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/di/ActivityBuilderModule.kt" />
     <mkdir at="${escapeXmlAttribute(srcOut)}/feature" />
<#if useGlide>
    <instantiate from="root/src/app_package/glide/GlideAppFactory.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/glide/GlideAppFactory.kt" />
    <instantiate from="root/src/app_package/glide/GlideModule.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/glide/${className}GlideModule.kt" />
    <instantiate from="root/src/app_package/glide/ImageViewBindingAdapters.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/glide/ImageViewBindingAdapters.kt" />
</#if>
</recipe>