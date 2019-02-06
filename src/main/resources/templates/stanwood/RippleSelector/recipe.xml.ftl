<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
<#if shapeType == 'none'>
    <instantiate from="root/res/drawable/ripple_selector.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/${selectorName}.xml" />
<#else>
    <instantiate from="root/res/drawable/ripple_shape_selector.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/${selectorName}.xml" />
</#if>
<#if (cornerRadius?number > 0)>
    <merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
</#if>
</recipe>
