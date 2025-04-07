// Prevent the manifest from changing every build
tasks.withType<Jar> {
    manifest.attributes["Date"] = ""
}

// Prevent timestamps from appearing in JAR and use reproducible file order
tasks.withType<AbstractArchiveTask> {
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}
