package io.stanwood.android

import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.net.JarURLConnection

/**
 * Strongly inspired by https://coderanch.com/t/472574/java/extract-directory-current-jar - mostly just auto-migrated to
 * Kotlin. We will manually convert this to canonical Kotlin soon.
 */

/**
 * extract the subdirectory from a jar on the classpath to `writeDirectory`
 *
 * @param sourceDirectory directory (in a jar on the classpath) to extract
 * @param writeDirectory  the location to extract to
 * @throws IOException if an IO exception occurs
 */
@Throws(IOException::class)
fun extract(sourceDirectory: String, writeDirectory: String, context: Class<*>) {
    File(writeDirectory).mkdirs()

    val dirURL = context.getResource(sourceDirectory)
    val path = sourceDirectory.substring(1)

    if (dirURL != null && dirURL.protocol == "jar") {
        val jarConnection = dirURL.openConnection() as JarURLConnection
        println("jarConnection is $jarConnection")

        val jar = jarConnection.jarFile

        val entries = jar.entries() // gives ALL entries in jar

        while (entries.hasMoreElements()) {
            val entry = entries.nextElement()
            val name = entry.name
            // System.out.println( name );
            if (!name.startsWith(path)) {
                // entry in wrong subdir -- don't copy
                continue
            }
            val entryTail = name.substring(path.length)

            val f = File(writeDirectory + File.separator + entryTail)
            if (entry.isDirectory) {
                // if its a directory, create it
                val bMade = f.mkdir()
                println((if (bMade) "  creating " else "  unable to create ") + name)
            } else {
                println("  writing  $name")
                val `is` = jar.getInputStream(entry)
                val os = BufferedOutputStream(FileOutputStream(f))
                `is`.copyTo(os, 4096)
                os.close()
                `is`.close()
            }
        }

    } else if (dirURL == null) {
        throw IllegalStateException("can't find $sourceDirectory on the classpath")
    } else {
        // not a "jar" protocol URL
        throw IllegalStateException("don't know how to handle extracting from $dirURL")
    }
}