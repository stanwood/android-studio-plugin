kapt {
    correctErrorTypes true
}
android {
    defaultConfig {
        resValue 'string', 'app_name', 'Name' // TODO: Replace name, remove app_name from strings.xml
    }
    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
        stage {
            matchingFallbacks = ['release', 'debug']
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            versionNameSuffix "-$buildNumber"
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    dataBinding {
        enabled true
    }
    applicationVariants.all { variant ->
        def appName = variant.mergedFlavor.resValues.get('app_name').getValue()
        if (variant.buildType.name == "debug" || variant.buildType.name == "stage") {
            appName = "${r"${rootProject.ext.buildNumber} "}" + appName + "${r" ${variant.buildType.name}"}"
        }
        variant.resValue 'string', 'app_name', appName
    }
}
dependencies {
    kapt 'com.google.dagger:dagger-compiler:${versionDagger}'
    kapt 'com.google.dagger:dagger-android-processor:${versionDagger}'
<#if useGlide>	
    kapt 'com.github.bumptech.glide:compiler:${versionGlide}'
</#if>
}