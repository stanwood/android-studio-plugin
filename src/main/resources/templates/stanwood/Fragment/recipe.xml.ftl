<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="androidx.appcompat:appcompat:1.+"/>
    <dependency mavenUrl="android.arch.lifecycle:extensions:1.+"/>
	<dependency mavenUrl="androidx.lifecycle:lifecycle-viewmodel-ktx:1.+"/>
	<dependency mavenUrl="com.google.android.material:material:1.0.0"/>
<#if canNavigate>			
	<dependency mavenUrl="io.reactivex.rxjava2:rxkotlin:2.3.0"/>
	<dependency mavenUrl="io.reactivex.rxjava2:rxandroid:2.1.0"/>
    <dependency mavenUrl="android.arch.navigation:navigation-fragment-ktx:1.0.0-alpha09"/>
    <dependency mavenUrl="android.arch.navigation:navigation-ui-ktx:1.0.0-alpha09"/>        
</#if>
	<instantiate from="root/src/app_package/di/FragmentModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${className}Module.kt" />

	<instantiate from="root/src/app_package/di/FragmentSubModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/${className}SubModule.kt" />
				   
	<instantiate from="root/src/app_package/ui/Fragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className}.kt" />
<#if useVm>					   

	<#include "root://stanwood/common/recipe_loader.xml.ftl" />

	<instantiate from="root/src/app_package/vm/ViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/vm/${viewModelName}.kt" />					   				   
</#if>
<#if fragmentLayoutType == 'list'>
	<instantiate from="root/src/app_package/ui/Adapter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${adapterName}.kt" />
	<instantiate from="root/res/layout/fragment_list.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />				   				   
    <#include "root://stanwood/common/recipe_item_layout.xml.ftl" />
<#else>
	<instantiate from="root/res/layout/fragment.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />				   	
</#if>		
</recipe>
