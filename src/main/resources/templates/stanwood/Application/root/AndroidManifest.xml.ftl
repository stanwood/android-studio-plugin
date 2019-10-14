<manifest xmlns:android="http://schemas.android.com/apk/res/android">
<#if useGlide>
	<uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
</#if>
    <application 
    android:name="${packageName}.${className}" 
    android:theme="@style/AppTheme.Light">

    </application>

</manifest>
