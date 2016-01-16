<#--

     Copyright 2012-2016 Gunnar Morling (http://www.gunnarmorling.de/)
     and/or other contributors as indicated by the @authors tag. See the
     copyright.txt file in the distribution for a full listing of all
     contributors.

     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.

-->
<#if ( ext.existingInstanceMapping ) >
    if ( ${ext.targetBeanName}.${targetGetterName}() != null ) {
        ${ext.targetBeanName}.${targetGetterName}().clear();
        <#if ext.targetType.collectionType>
            <@includeModel object=assignment
                   targetBeanName=ext.targetBeanName
                   existingInstanceMapping=ext.existingInstanceMapping
                   targetReadAccessorName=ext.targetReadAccessorName
                   targetWriteAccessorName="${targetGetterName}().addAll"
                   targetType=ext.targetType/>
        <#else>
            <@includeModel object=assignment
                   targetBeanName=ext.targetBeanName
                   existingInstanceMapping=ext.existingInstanceMapping
                   targetReadAccessorName=ext.targetReadAccessorName
                   targetWriteAccessorName="${targetGetterName}().putAll"
                   targetType=ext.targetType/>
        </#if>
    }
    else {
        <#if newCollectionOrMapAssignment??>
            <@_newCollectionOrMapAssignment/>
        <#else>
            <@_assignment/>
        </#if>
    }
<#else>
    <#if newCollectionOrMapAssignment??>
        <@_newCollectionOrMapAssignment/>
    <#else>
        <@_assignment/>
    </#if>
</#if>
<#macro _assignment>
    <@includeModel object=assignment
            targetBeanName=ext.targetBeanName
            existingInstanceMapping=ext.existingInstanceMapping
            targetReadAccessorName=ext.targetReadAccessorName
            targetWriteAccessorName=ext.targetWriteAccessorName
            targetType=ext.targetType/>
</#macro>
<#macro _newCollectionOrMapAssignment>
    <@includeModel object=newCollectionOrMapAssignment
            targetBeanName=ext.targetBeanName
            existingInstanceMapping=ext.existingInstanceMapping
            targetReadAccessorName=ext.targetReadAccessorName
            targetWriteAccessorName=ext.targetWriteAccessorName
            targetType=ext.targetType/>
</#macro>