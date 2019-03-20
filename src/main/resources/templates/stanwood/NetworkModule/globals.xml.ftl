<?xml version="1.0"?>
<globals>
    <#include "../common/common_globals.xml.ftl" />
    <global id="apiFolderName" value="${(apiName?replace(' ',''))?lower_case}" />
    <global id="apiClassName" value="${underscoreToCamelCase(apiName)}Api" />
    <global id="authManagerClassName" value="${underscoreToCamelCase(apiName)}AuthManager" />
    <global id="apiModelClassName" value="${underscoreToCamelCase(apiName)+modelClassName}" />
    <global id="repositoryClassName" value="${underscoreToCamelCase(apiName)}Repository" />
</globals>
