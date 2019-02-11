<?xml version="1.0" encoding="utf-8"?>
<#assign hasCorners = (shapeType == 'rectangle' && cornerRadius?number > 0) >
<ripple xmlns:android="http://schemas.android.com/apk/res/android"
<#if usePressedColor>
	android:color="@color/${pressedColorName}">
<#else>
	android:color="?android:colorControlHighlight">
</#if>
    <item
        android:id="@android:id/mask" >
        <shape
            android:shape="${shapeType}">
            <#if hasCorners>
            <corners android:radius="@dimen/${cornerRadiusName}" />
            </#if>
            <solid android:color="@color/${colorName}" />
        </shape>
    </item>
    <item>
        <selector>
<#if useDisabledColor>
            <item android:state_enabled="false">
                <shape
                    android:shape="${shapeType}">
                    <#if hasCorners>
                    <corners android:radius="@dimen/${cornerRadiusName}" />
                    </#if>
                    <solid android:color="@color/${disabledColorName}" />
                </shape>
            </item>
</#if>
<#if useSelectedColor>
            <item android:state_selected="true">
                <shape
                    android:shape="${shapeType}">
                    <#if hasCorners>
                    <corners android:radius="@dimen/${cornerRadiusName}" />
                    </#if>
                    <solid android:color="@color/${selectedColorName}" />
                </shape>
            </item>
</#if>
            <item>
                <shape
                    android:shape="${shapeType}">
                    <#if hasCorners>
                    <corners android:radius="@dimen/${cornerRadiusName}" />
                    </#if>
                    <solid android:color="@color/${colorName}" />
                </shape>
            </item>
        </selector>
    </item>
</ripple>