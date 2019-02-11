<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe folder="root://stanwood/common">
    <merge from="root/res/values/item_layout_colors.xml.ftl"
           to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <merge from="root/res/values/item_layout_dimens.xml.ftl"
           to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

    <merge from="root/res/values/item_layout_styles.xml.ftl"
           to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
<#if itemLayoutType == 'hor'>
	<dependency mavenUrl="androidx.constraintlayout:constraintlayout:${versionConstraintLayout}"/>
    <instantiate from="root/res/layout/layout_hor_image_title_subtitle.xml.ftl"
                     to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />
</#if>
<#if itemLayoutType == 'ver'>
	<dependency mavenUrl="androidx.constraintlayout:constraintlayout:${versionConstraintLayout}"/>
    <instantiate from="root/res/layout/layout_ver_image_title_subtitle.xml.ftl"
                     to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />
</#if>
<#if itemLayoutType == 'simple'>
    <instantiate from="root/res/layout/layout_title.xml.ftl"
                     to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />
</#if>
<#if createItemViewModel!false>
    <instantiate from="root/src/app_package/ItemViewModel.kt.ftl"
                 to="${escapeXmlAttribute(srcOut)}/<#if itemCreatePackage!false>vm/</#if>${itemViewModelName}.kt" />
</#if>
</recipe>