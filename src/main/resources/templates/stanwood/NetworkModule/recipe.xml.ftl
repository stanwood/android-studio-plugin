<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="com.squareup.retrofit2:retrofit:${versionRetrofit}" />
    <dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava2:${versionRetrofit}" />
    <dependency mavenUrl="com.github.stanwood:debug_app_android:${versionDebugApp}" />
    <dependency mavenUrl="com.github.stanwood:framework-network-android:${versionNetworkFramework}" />
    <dependency mavenUrl="com.github.stanwood.framework-arch-android:di:${versionArchFramework}"/>
    <dependency mavenUrl="org.jetbrains.kotlinx:kotlinx-serialization-runtime:${versionSerialization}" />
    <apply plugin="kotlinx-serialization" />
    <merge from="root/root.gradle.ftl"
                  to="${escapeXmlAttribute(projectLocation)}/build.gradle" />

    <instantiate from="root/src/app_package/datasource/NetworkModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/datasource/NetworkModule.kt" />

    <instantiate from="root/src/app_package/datasource/net/sample/DummyApi.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/datasource/net/${apiFolderName}/${apiClassName}.kt" />
    
    <instantiate from="root/src/app_package/datasource/net/sample/DummySampleData.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/datasource/net/${apiFolderName}/${apiModelClassName}.kt" />

    <instantiate from="root/src/app_package/repository/sample/SampleData.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/repository/${apiFolderName}/${modelClassName}.kt" />

    <instantiate from="root/src/app_package/repository/sample/SampleDataMapper.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/repository/${apiFolderName}/${modelClassName}Mapper.kt" />

    <instantiate from="root/src/app_package/repository/sample/SampleRepository.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/repository/${apiFolderName}/${repositoryClassName}.kt" />

    <instantiate from="root/src/app_package/interactor/Interactor.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/interactor/Get${modelClassName}Interactor.kt" />
</recipe>