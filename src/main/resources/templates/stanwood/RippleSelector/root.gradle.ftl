allprojects {
    repositories {
        google()
        jcenter()
        maven { url 'https://jitpack.io' }
    }

    gradle.projectsEvaluated {
        tasks.withType(JavaCompile) {
            options.compilerArgs << "-Xmaxerrs" << "500"
        }
    }
}