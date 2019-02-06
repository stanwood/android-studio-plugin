kapt {
    correctErrorTypes true
}
android {
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    dataBinding {
        enabled true
    }
    buildTypes {
        stage {
            matchingFallbacks = ['release','debug']
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}	
dependencies {
    kapt 'com.google.dagger:dagger-compiler:${versionDagger}'
    kapt 'com.google.dagger:dagger-android-processor:${versionDagger}'
    implementation 'com.github.stanwood:framework-arch-android:${versionFramework}'
<#if useGlide>	
	implementation "com.github.bumptech.glide:glide:${versionGlide}"
    kapt "com.github.bumptech.glide:compiler:${versionGlide}"
</#if>	
}