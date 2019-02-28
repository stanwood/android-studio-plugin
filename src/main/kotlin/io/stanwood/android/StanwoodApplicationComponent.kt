package io.stanwood.android

import com.android.tools.idea.templates.TemplateManager
import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.ApplicationComponent
import org.apache.commons.io.FileUtils
import java.io.File


class StanwoodApplicationComponent : ApplicationComponent, Disposable {

    private var isDynamicTemplateMenuCreated = false

    override fun initComponent() {
        if (!ApplicationManager.getApplication().isUnitTestMode &&
            !ApplicationManager.getApplication().isHeadlessEnvironment
        ) {
            createStanwoodComponents()
        }
    }

    private fun createStanwoodComponents() {
        createDynamicTemplateMenu()
    }

    private fun createDynamicTemplateMenu() {
        if (isDynamicTemplateMenuCreated) {
            return
        }

        isDynamicTemplateMenuCreated = true

        // write templates to user config folder (~/.android/templates)
        TemplateManager.getTemplateRootFolder()?.let { studioTemplateFolder ->
            File(studioTemplateFolder, "stanwood")
                .apply {
                    mkdirs()
                    FileUtils.cleanDirectory(this)
                }
                .let { userTemplatesFolder ->
                    if (userTemplatesFolder.isDirectory) {
                        extract(
                            "/templates/stanwood/",
                            userTemplatesFolder.path,
                            javaClass
                        )

//                        javaClass.classLoader.getResourceAsStream("templates").let { pluginTemplates ->
//                            val tos = FileOutputStream(userTemplatesFolder)
//                            IOUtils.copy(
//                                pluginTemplates,
//                                tos
//                            )
////                            java.nio.file.Files.copy(
////                                pluginTemplates,
////                                File(userTemplatesFolder, "test.txt").toPath(),
////                                StandardCopyOption.REPLACE_EXISTING
////                            )
//
//                            tos.close()
//                            pluginTemplates.close()
//                            // the AndroidProjectComponent will pick those up later
////                                templateManager.refreshDynamicTemplateMenu(null)
//                        }
                    }
                }
        }
    }

    override fun dispose() {
        // no-op
    }


}