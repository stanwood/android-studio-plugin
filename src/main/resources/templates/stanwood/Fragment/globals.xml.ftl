<?xml version="1.0"?>
<globals>
    <#include "root://activities/common/common_globals.xml.ftl" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="createItemViewModel" type="boolean" value="${(fragmentLayoutType == 'list')?c}" />
    <global id="sampleData" type="boolean" value="${(fragmentLayoutType == 'list')?c}" />
    <global id="itemCreatePackage" type="boolean" value="true" />
</globals>