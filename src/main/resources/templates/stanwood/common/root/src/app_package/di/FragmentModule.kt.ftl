package ${kotlinEscapedPackageName}.di

import dagger.Module
import io.stanwood.framework.arch.di.module.FragmentModule
import ${kotlinEscapedPackageName}.ui.${className}

@Module(includes = [${className}SubModule::class])
abstract class ${className}Module : FragmentModule<${className}>() {

    // TODO : Provide e.g. Fragments created by this Fragment
}