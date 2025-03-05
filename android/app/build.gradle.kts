plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") version "1.8.22"
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.enviro"
    compileSdk = 34  // ⚠️ Mets à jour si nécessaire

    defaultConfig {
        applicationId = "com.example.enviro"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }
}

flutter {
    source = "../.."
}
