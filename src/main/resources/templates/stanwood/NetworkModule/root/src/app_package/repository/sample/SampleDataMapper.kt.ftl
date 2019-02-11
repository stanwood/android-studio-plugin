package ${kotlinEscapedPackageName}.repository.${apiFolderName}

import ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}.${apiModelClassName}

//TODO: Add mapping for added properties
fun ${apiModelClassName}.mapToDomain()=
    ${modelClassName}(this.id)
