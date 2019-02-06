<?xml version="1.0" encoding="utf-8"?>
<ripple xmlns:android="http://schemas.android.com/apk/res/android"
    <#if usePressedColor>
	android:color="@color/${pressedColorName}">
<#else>
	android:color="?android:colorControlHighlight">
</#if>
    <item>
        <selector>
<#if useDisabledColor>
            <item android:state_enabled="false">
                <color android:color="@color/${disabledColorName}" />
            </item>
</#if>
<#if useSelectedColor>
            <item android:state_selected="true">
                <color android:color="@color/${selectedColorName}" />
            </item>
</#if>
            <item>
                <color android:color="@color/${colorName}" />
            </item>
        </selector>
    </item>
</ripple>