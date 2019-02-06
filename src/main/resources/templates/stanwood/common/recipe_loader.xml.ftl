<recipe folder="root://stanwood/common">
    <dependency mavenUrl="android.arch.lifecycle:extensions:1.+"/>
    <dependency mavenUrl="androidx.lifecycle:lifecycle-viewmodel-ktx:1.+"/>
<#if sampleData!false>
    <dependency mavenUrl="io.reactivex.rxjava2:rxkotlin:2.3.0"/>
    <dependency mavenUrl="io.reactivex.rxjava2:rxandroid:2.1.0"/>
    <instantiate from="root/src/app_package/loader/SampleLoader.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/loader/${loaderName}.kt" />

    <instantiate from="root/src/app_package/loader/SampleLoaderImpl.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/loader/${loaderName}Impl.kt" />
<#else>
    <instantiate from="root/src/app_package/loader/Loader.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/loader/${loaderName}.kt" />

    <instantiate from="root/src/app_package/loader/LoaderImpl.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/loader/${loaderName}Impl.kt" />
</#if>

    </recipe>