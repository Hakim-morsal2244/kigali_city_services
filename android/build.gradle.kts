apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services' // Firebase plugin

android {
    compileSdkVersion 34

    defaultConfig {
        applicationId "com.example.kigali_city_services"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0"

        multiDexEnabled true
    }

    buildTypes {
        release {
            minifyEnabled false
            shrinkResources false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.9.0"

    // Flutter dependencies
    implementation "com.google.android.material:material:1.10.0"

    // Firebase BoM (Bill of Materials) ensures all Firebase SDKs are compatible
    implementation platform('com.google.firebase:firebase-bom:34.10.0')

    // Firebase products you need
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'

    // Optional: For maps
    implementation 'com.google.android.gms:play-services-maps:18.2.0'

    // Multidex support
    implementation 'androidx.multidex:multidex:2.0.1'
}

// Make sure to sync Gradle after this