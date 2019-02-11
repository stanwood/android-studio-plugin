<recipe folder="root://stanwood/common">
<#if useDataProvider!false && useVm!true>
        <dependency mavenUrl="com.github.stanwood.framework-arch-android:di:${versionArchFramework}"/>
    <#if sampleData!false>
        <instantiate from="root/src/app_package/dataprovider/SampleDataProvider.kt.ftl"
                    to="${escapeXmlAttribute(srcOut)}/dataprovider/${dataProviderName}.kt" />

        <instantiate from="root/src/app_package/dataprovider/SampleDataProviderImpl.kt.ftl"
                    to="${escapeXmlAttribute(srcOut)}/dataprovider/${dataProviderName}Impl.kt" />
    <#else>
        <instantiate from="root/src/app_package/dataprovider/DataProvider.kt.ftl"
                    to="${escapeXmlAttribute(srcOut)}/dataprovider/${dataProviderName}.kt" />

        <instantiate from="root/src/app_package/dataprovider/DataProviderImpl.kt.ftl"
                    to="${escapeXmlAttribute(srcOut)}/dataprovider/${dataProviderName}Impl.kt" />
    </#if>
</#if>
</recipe>