package ${escapeKotlinIdentifiers(packageName)}.di

import dagger.Module
import dagger.android.ContributesAndroidInjector
import io.stanwood.framework.arch.di.module.ActivityModule
import ${escapeKotlinIdentifiers(packageName)}.ui.${activityClass}

@Module(includes = [${activityClass}SubModule::class])
abstract class ${activityClass}Module : ActivityModule<${activityClass}>() {

}