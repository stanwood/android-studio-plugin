package ${kotlinEscapedPackageName}.interactor

import ${kotlinEscapedPackageName}.repository.${apiFolderName}.${repositoryClassName}
import javax.inject.Inject

class Get${modelClassName}Interactor @Inject constructor(private val repository: ${repositoryClassName}) {
    fun get${modelClassName}() = repository.fetch${modelClassName}()
}