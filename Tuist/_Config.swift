//import ProjectDescription
//
//let config = Config(
//    compatibleXcodeVersions: CompatibleXcodeVersions("10.3"),
//    cloud: Cloud.cloud(
//        projectId: "ProjectId",
//        url: "url",
//        options: [
//            Cloud.Option.disableAnalytics, 
//            Cloud.Option.optional
//        ]
//    ),
//    cache: Cache.cache(
//        profiles: [
//            Cache.Profile.profile(
//                name: "Profile",
//                configuration: "Configuration",
//                device: "mac",
//                os: "14.2"
//            )
//        ],
//        path: Path.relativeToRoot(".")
//    ),
//    swiftVersion: "5.9.2",
//    plugins: [
//        PluginLocation.git(url: "url", sha: "sha")
//    ],
//    generationOptions: Config.GenerationOptions.options(
//        resolveDependenciesWithSystemScm: true,
//        disablePackageVersionLocking: true,
//        clonedSourcePackagesDirPath: .relativeToRoot("."),
//        staticSideEffectsWarningTargets: Config.GenerationOptions.StaticSideEffectsWarningTargets.all
//    )
//)
