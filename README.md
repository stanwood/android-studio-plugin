# Stanwood Android Studio Plugin

_This Android Studio plugin brings rapid app development to all Android developers at stanwood._

[JetBrains plugin page](https://plugins.jetbrains.com/plugin/11954-stanwood-android-templates)

## Installation

Just search for Stanwood in the Jetbrains Plugin Repository and install right from your IDE. :)

We support AS 3.3+, although we might backport to older versions if there is enough demand and it doesn't cost us too much time.

## Capabilities

Currently the plugin provides a set of templates and wizards which you can find via the _New..._ menu. Look out for the _Stanwood_ entry!

## Development

1. Best develop using IntelliJ CE.
1. Adapt the distribution and _android.jar_ plugin path to your local AS distribution (best use AS 3.3 for that).
1. Add a IntelliJ Plugin SDK, Java 1.8 SDK and Kotlin SDK to the project.
1. Do not run via the run menu - instead just run `./gradlew buildPlugin` via the terminal and then install the JAR (find it in `build/libs`) from within AS plugin manager (_Install from disk_).
1. Before uploading a new version make sure to increase the version in `build.gradle`

Check out AS logs when the plugin misbehaves.

Should the plugin crash AS might disable it. Make sure to re-enable it in the plugin manager when installing a new version.