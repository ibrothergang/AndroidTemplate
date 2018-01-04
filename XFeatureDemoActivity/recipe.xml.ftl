<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   <#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
       <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />
    </#if>

    <#if (buildApi gte 22) && appCompat && !(hasDependency('com.android.support:design'))>
        <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
    </#if>

    <#if !appCompat && (includePermissionCheck!false)>
        <dependency mavenUrl="com.android.support:support-annotations:${buildApi}.+" />
    </#if>

    <instantiate from="root/res/layout/activity_feature_demo.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

<#if generateKotlin>
    <@kt.addAllKotlinDependencies />
    <instantiate from="root/src/app_package/FeatureDemoActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />
<#else>
    <instantiate from="root/src/app_package/FeatureDemoActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</#if>

<merge from="root/AndroidManifest.xml.ftl"
        to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

</recipe>
