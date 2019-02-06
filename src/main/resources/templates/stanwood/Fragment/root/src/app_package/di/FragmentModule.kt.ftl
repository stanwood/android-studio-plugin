package ${escapeKotlinIdentifiers(packageName)}.di

import dagger.Module
import io.stanwood.framework.arch.di.module.FragmentModule
import ${escapeKotlinIdentifiers(packageName)}.ui.${className}

@Module(includes = [${className}SubModule::class])
abstract class ${className}Module : FragmentModule<${className}>() {
}