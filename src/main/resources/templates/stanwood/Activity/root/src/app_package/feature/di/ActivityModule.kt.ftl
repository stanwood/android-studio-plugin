package ${kotlinEscapedPackageName}.di

import dagger.Module
import dagger.android.ContributesAndroidInjector
import io.stanwood.framework.arch.di.module.ActivityModule
import ${kotlinEscapedPackageName}.ui.${activityClass}

@Module(includes = [${activityClass}SubModule::class])
abstract class ${activityClass}Module : ActivityModule<${activityClass}>() {
// TODO : Provide Fragments created by this Activity
}