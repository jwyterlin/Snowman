import ProjectDescription

// TEMPLATE
//
//let projectConfiguration: Configuration = .debug(
//    name: "Debug",
//    // Add your xcconfig here per environment which will for instance contain your different bundleIds, etc
////    xcconfig: .relativeToRoot("Targets/MyExampleApp/Configurations/Dev/MyExampleApp.xcconfig")
//    xcconfig: .relativeToRoot("./SnowmanProject.xcconfig")
//)
//
//
//
//let snowmanConfiguration: Configuration = .debug(
//    name: "Snowman",
//    // Add your xcconfig here per environment which will for instance contain your different bundleIds, etc
////    xcconfig: .relativeToRoot("Targets/MyExampleApp/Configurations/Dev/MyExampleApp.xcconfig")
//    xcconfig: .relativeToRoot("./Snowman.xcconfig")
//)
//
//let aProject = Project(
//    name: "Snowman",
//    organizationName: "Kodeco",
//    options: .options(
//        automaticSchemesOptions: .disabled,
//        defaultKnownRegions: nil,
//        developmentRegion: nil,
//        disableBundleAccessors: false,
//        disableShowEnvironmentVarsInScriptPhases: false,
//        disableSynthesizedResourceAccessors: false,
//        textSettings: .textSettings(
//            usesTabs: nil,
//            indentWidth: nil,
//            tabWidth: nil,
//            wrapsLines: nil
//        ),
//        xcodeProjectName: nil
//    ),
//    packages: [Package.local(path: Path.relativeToCurrentFile("."))],
//    settings: Settings.settings(
//        configurations: [
//            Configuration.debug(
//                name: ConfigurationName.debug,
//                xcconfig: Path.relativeToRoot("SnowmanProject.xcconfig")
//            ),
//            Configuration.release(
//                name: ConfigurationName.release,
//                xcconfig: Path.relativeToRoot("SnowmanProject.xcconfig")
//            )
//        ]
//    ), 
//    targets: [
//        Target(
//            name: "Snowman",
//            destinations: [
//                .appleTv,
//                .appleVision,
//                .appleVisionWithiPadDesign,
//                .appleWatch,
//                .iPad,
//                .iPhone,
//                .mac,
//                .macCatalyst,
//                .macWithiPadDesign
//            ],
//            product: Product.app,
//            productName: "Snowman",
//            bundleId: "com.yourcompany.Snowman",
//            deploymentTargets: DeploymentTargets.macOS("13.0"),
//            infoPlist: InfoPlist.default,
//            sources: ["Snowman/**"],
//            resources: ["Resources/**"],
//            copyFiles: [
//                CopyFilesAction.executables(
//                    name: "", 
//                    files: [
//                        FileElement.folderReference(
//                            path: Path.relativeToRoot("")
//                        )
//                    ]
//                ),
//                CopyFilesAction.frameworks(
//                    name: "",
//                    files: [
//                        FileElement.folderReference(
//                            path: Path.relativeToRoot("")
//                        )
//                    ]
//                )
//            ],
//            headers: Headers.allHeaders(
//                from: FileList.list(
//                    [
//                        FileListGlob.glob(
//                            Path.relativeToRoot("")
//                        )
//                    ]
//                ),
//                umbrella: Path.relativeToRoot("")
//            ),
//            entitlements: Entitlements.file(path: "Snowman/Snowman.entitlements"),
//            scripts: [
//                TargetScript.pre(
//                    path: Path.relativeToRoot(""),
//                    arguments: "",
//                    name: "",
//                    inputPaths: [
//                        FileListGlob.glob(
//                            Path.relativeToRoot("")
//                        )
//                    ],
//                    inputFileListPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    outputPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    outputFileListPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    basedOnDependencyAnalysis: false,
//                    runForInstallBuildsOnly: false,
//                    shellPath: "",
//                    dependencyFile: Path.relativeToRoot("")
//                ),
//                TargetScript.post(
//                    script: "",
//                    name: "",
//                    inputPaths: [
//                        FileListGlob.glob(
//                            Path.relativeToRoot("")
//                        )
//                    ],
//                    inputFileListPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    outputPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    outputFileListPaths: [
//                        Path.relativeToRoot("")
//                    ],
//                    basedOnDependencyAnalysis: false,
//                    runForInstallBuildsOnly: false,
//                    shellPath: "",
//                    dependencyFile: Path.relativeToRoot("")
//                )
//            ], 
//            dependencies: [
//                TargetDependency.external(
//                    name: "",
//                    condition: PlatformCondition.when(
//                        [
//                            .catalyst,
//                            .driverkit,
//                            .ios,
//                            .macos,
//                            .tvos,
//                            .visionos,
//                            .watchos
//                        ]
//                    )
//                )
//            ], 
//            settings: Settings.settings(
//                base: SettingsDictionary()
//                    .appleGenericVersioningSystem()
//                    .automaticCodeSigning(devTeam: "")
//                    .bitcodeEnabled(true)
//                    .codeSignIdentity("")
//                    .codeSignIdentityAppleDevelopment()
//                    .currentProjectVersion("")
//                    .debugInformationFormat(
////                        DebugInformationFormat.dwarf
//                        DebugInformationFormat.dwarfWithDsym
//                    )
//                    .manualCodeSigning(
//                        identity: "",
//                        provisioningProfileSpecifier: ""
//                    )
//                    .marketingVersion("")
//                    .otherCFlags([""])
//                    .otherLinkerFlags([""])
//                    .otherSwiftFlags("-d", "-e")
//                    .swiftActiveCompilationConditions("a", "b", "c")
//                    .swiftCompilationMode(
////                        .singlefile
//                        .wholemodule
//                    )
//                    .swiftObjcBridgingHeaderPath("")
//                    .swiftOptimizationLevel(
////                        .o
////                        .oNone
//                        .oSize
//                    )
//                    .swiftOptimizeObjectLifetimes(true)
//                    .swiftVersion("5.0")
//                    .versionInfo("")
//                ,
//                configurations: [
//                    Configuration.debug(
//                        name: ConfigurationName.debug,
////                        settings: SettingsDictionary(),
//                        xcconfig: Path.relativeToRoot("./Snowman.xcconfig")
//                    ),
//                    Configuration.release(
//                        name: ConfigurationName.release,
////                        settings: SettingsDictionary(),
//                        xcconfig: Path.relativeToRoot("./Snowman.xcconfig")
//                    )
//                ]
////                defaultSettings:
////                    DefaultSettings.essential(excluding: [""])
////                    DefaultSettings.none
////                    DefaultSettings.recommended(excluding: [""])
//            ),
//            coreDataModels: [
//                CoreDataModel.init(
//                    Path.relativeToRoot(""),
//                    currentVersion: ""
//                )
//            ],
//            environmentVariables: [
//                "a" : EnvironmentVariable(value: "anyvalue", isEnabled: true)],
//            launchArguments: [
//                LaunchArgument(name: "name", isEnabled: true)
//            ],
//            additionalFiles: [
//                FileElement.folderReference(
//                    path: Path.relativeToRoot("")
//                )
//            ], 
//            buildRules: [
//                BuildRule(
//                    name: "",
//                    fileType: BuildRule.FileType.assemblyAsm,
//                    filePatterns: "",
//                    compilerSpec: BuildRule.CompilerSpec.appIntentsMetadataExtractor,
//                    inputFiles: [""],
//                    outputFiles: [""],
//                    outputFilesCompilerFlags: [""],
//                    script: "",
//                    runOncePerArchitecture: true
//                )
//            ], 
//            mergedBinaryType: MergedBinaryType.automatic,
//            mergeable: true
//        )
//    ],
//    schemes: [
//        Scheme(
//            name: "",
//            shared: true,
//            hidden: true,
//            buildAction: BuildAction(
//                targets: [
//                    TargetReference(
//                        projectPath: Path.relativeToRoot(""),
//                        target: ""
//                    )
//                ], 
//                preActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                postActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                runPostActionsOnFailure: true
//            ),
//            testAction: TestAction.targets(
//                    [
//                        TestableTarget(
//                            target: TargetReference(
//                                projectPath: Path.relativeToRoot(""),
//                                target: ""
//                            ),
//                            skipped: true,
//                            parallelizable: true,
//                            randomExecutionOrdering: true
//                        )
//                    ], 
//                    arguments: Arguments(
//                        environmentVariables: [
//                            "key" : EnvironmentVariable(
//                                value: "value",
//                                isEnabled: true
//                            )
//                        ],
//                        launchArguments: [
//                            LaunchArgument(name: "name", isEnabled: true)
//                        ]
//                    ),
//                    configuration: ConfigurationName.debug,
//                    attachDebugger: true,
//                    expandVariableFromTarget: TargetReference(
//                        projectPath: Path.relativeToRoot(""),
//                        target: ""
//                    ),
//                    preActions: [
//                        ExecutionAction(
//                            title: "",
//                            scriptText: "",
//                            target: TargetReference(
//                                projectPath: Path.relativeToRoot(""),
//                                target: ""
//                            ),
//                            shellPath: ""
//                        )
//                    ], 
//                    postActions: [
//                        ExecutionAction(
//                            title: "",
//                            scriptText: "",
//                            target: TargetReference(
//                                projectPath: Path.relativeToRoot(""),
//                                target: ""
//                            ),
//                            shellPath: ""
//                        )
//                    ], 
//                    options: TestActionOptions.options(
//                        language: SchemeLanguage.accentedPseudoLanguage,
//                        region: "",
//                        preferredScreenCaptureFormat: ScreenCaptureFormat.screenRecording,
//                        coverage: true,
//                        codeCoverageTargets: [
//                            TargetReference(
//                                projectPath: Path.relativeToRoot(""),
//                                target: ""
//                            )
//                        ]
//                    ),
//                    diagnosticsOptions: [
//                        SchemeDiagnosticsOption.enableAddressSanitizer,
//                        SchemeDiagnosticsOption.enableDetectStackUseAfterReturn,
//                        SchemeDiagnosticsOption.enableThreadSanitizer,
//                        SchemeDiagnosticsOption.mainThreadChecker,
//                        SchemeDiagnosticsOption.performanceAntipatternChecker
//                    ]
//                ),
//            runAction: RunAction.runAction(
//                configuration: ConfigurationName.debug,
//                attachDebugger: true,
//                customLLDBInitFile: Path.relativeToRoot(""),
//                preActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                postActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                executable: TargetReference(
//                    projectPath: Path.relativeToRoot(""),
//                    target: ""
//                ),
//                arguments: Arguments(
//                    environmentVariables: [
//                        "key" : EnvironmentVariable(
//                            value: "value",
//                            isEnabled: true
//                        )
//                    ],
//                    launchArguments: [
//                        LaunchArgument(name: "name", isEnabled: true)
//                    ]
//                ),
//                options: RunActionOptions.options(
//                    language: SchemeLanguage.boundedStringPseudoLanguage,
//                    storeKitConfigurationPath: Path.relativeToRoot(""),
//                    simulatedLocation: RunActionOptions.SimulatedLocation.hongKong,
//                    enableGPUFrameCaptureMode: RunActionOptions.GPUFrameCaptureMode.autoEnabled
//                ),
//                diagnosticsOptions: [
//                    SchemeDiagnosticsOption.enableAddressSanitizer,
//                    SchemeDiagnosticsOption.enableDetectStackUseAfterReturn,
//                    SchemeDiagnosticsOption.enableThreadSanitizer,
//                    SchemeDiagnosticsOption.mainThreadChecker,
//                    SchemeDiagnosticsOption.performanceAntipatternChecker
//                ],
//                expandVariableFromTarget: TargetReference(
//                    projectPath: Path.relativeToRoot(""),
//                    target: ""
//                ),
//                launchStyle: LaunchStyle.waitForExecutableToBeLaunched
//            ),
//            archiveAction: ArchiveAction.archiveAction(
//                configuration: ConfigurationName.debug,
//                revealArchiveInOrganizer: true,
//                customArchiveName: "",
//                preActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                postActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ]
//            ),
//            profileAction: ProfileAction.profileAction(
//                configuration: ConfigurationName.debug,
//                preActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                postActions: [
//                    ExecutionAction(
//                        title: "",
//                        scriptText: "",
//                        target: TargetReference(
//                            projectPath: Path.relativeToRoot(""),
//                            target: ""
//                        ),
//                        shellPath: ""
//                    )
//                ], 
//                executable: TargetReference(
//                    projectPath: Path.relativeToRoot(""),
//                    target: ""
//                ),
//                arguments: Arguments(
//                    environmentVariables: [
//                        "key" : EnvironmentVariable(
//                            value: "value",
//                            isEnabled: true
//                        )
//                    ],
//                    launchArguments: [
//                        LaunchArgument(name: "name", isEnabled: true)
//                    ]
//                )
//            ), 
//            analyzeAction: AnalyzeAction.analyzeAction(
//                configuration: ConfigurationName.debug
//            )
//        )
//    ], 
//    fileHeaderTemplate: FileHeaderTemplate.file(Path.relativeToRoot("")),
//    additionalFiles: [
//        FileElement.folderReference(
//            path: Path.relativeToRoot("")
//        )
//    ], 
//    resourceSynthesizers: [
//        ResourceSynthesizer.assets(
//            parserOptions: [
//                "key" : ResourceSynthesizer.Parser.Option.boolean(true)
//            ]
//        ),
//        ResourceSynthesizer.coreData(),
//        ResourceSynthesizer.custom(
//            name: "",
//            parser: ResourceSynthesizer.Parser.files,
//            extensions: [""]
//        ),
//        ResourceSynthesizer.files(extensions: Set<String>()),
//        ResourceSynthesizer.fonts(),
//        ResourceSynthesizer.json(),
//        ResourceSynthesizer.plists(),
//        ResourceSynthesizer.strings(),
//        ResourceSynthesizer.yaml()
//    ]
//)

let project = Project(
    name: "Snowman",
    organizationName: "Kodeco",
    options: .options(
//        automaticSchemesOptions: .disabled,
        disableBundleAccessors: true,
        disableSynthesizedResourceAccessors: true
    ),
    settings: Settings.settings(
        configurations: [
            Configuration.debug(
                name: ConfigurationName.debug,
                xcconfig: Path.relativeToRoot("Configurations/SnowmanProject.xcconfig")
            ),
            Configuration.release(
                name: ConfigurationName.release,
                xcconfig: Path.relativeToRoot("Configurations/SnowmanProject.xcconfig")
            )
        ]
    ),
    targets: [
        Target(
            name: "Snowman",
            destinations: [.mac],
            product: .app,
            bundleId: "com.yourcompany.Snowman",
            deploymentTargets: DeploymentTargets.macOS("13.0"),
            infoPlist: nil,
            sources: ["Snowman/**"],
            resources: ["Snowman/Resources/**"],
//            headers: .headers(
//                public: ["Sources/public/A/**", "Sources/public/B/**"],
//                private: "Sources/private/**",
//                project: ["Sources/project/A/**", "Sources/project/B/**"]
//            ),
            entitlements: .file(path: Path.relativeToRoot("Snowman/Snowman.entitlements")),
//            dependencies: [
                /* Target dependencies can be defined here */
                /* .framework(path: "framework") */
//            ]
            settings: Settings.settings(
                configurations: [
                    Configuration.debug(
                        name: ConfigurationName.debug,
                        xcconfig: Path.relativeToRoot("Configurations/Snowman.xcconfig")
                    ),
                    Configuration.release(
                        name: ConfigurationName.release,
                        xcconfig: Path.relativeToRoot("Configurations/Snowman.xcconfig")
                    )
                ]
            )
        ),
        Target(
            name: "SnowmanTests",
            destinations: [.mac],
            product: .unitTests,
            bundleId: "com.jhonathanwyterlin.SnowmanTests",
            deploymentTargets: DeploymentTargets.macOS("13.0"),
            infoPlist: nil,
            sources: ["SnowmanTests/**"],
            dependencies: [
                .target(name: "Snowman")
            ],
            settings: Settings.settings(
                configurations: [
                    Configuration.debug(
                        name: ConfigurationName.debug,
                        xcconfig: Path.relativeToRoot("Configurations/SnowmanTests.xcconfig")
                    ),
                    Configuration.release(
                        name: ConfigurationName.release,
                        xcconfig: Path.relativeToRoot("Configurations/SnowmanTests.xcconfig")
                    )
                ]
            )
        ),
        Target(
            name: "SnowmanUITests",
            destinations: [.mac],
            product: .uiTests,
            bundleId: "com.jhonathanwyterlin.SnowmanUITests",
            deploymentTargets: DeploymentTargets.macOS("13.0"),
            infoPlist: nil,
            sources: ["SnowmanUITests/**"],
            dependencies: [
                .target(name: "Snowman")
            ],
            settings: Settings.settings(
                configurations: [
                    Configuration.debug(
                        name: ConfigurationName.debug,
                        xcconfig: Path.relativeToRoot("Configurations/SnowmanUITests.xcconfig")
                    ),
                    Configuration.release(
                        name: ConfigurationName.release,
                        xcconfig: Path.relativeToRoot("Configurations/SnowmanUITests.xcconfig")
                    )
                ]
            )
        )
    ],
    schemes: [
        Scheme(
            name: "Snowman",
            buildAction: BuildAction.buildAction(
                targets: [
                    TargetReference(stringLiteral: "Snowman")
                ]
            ),
            testAction: TestAction.targets(
                [
                    TestableTarget.init(
                        target: TargetReference(stringLiteral: "SnowmanTests")
                    ),
                    TestableTarget.init(
                        target: TargetReference(stringLiteral: "SnowmanUITests")
                    )
                ],
                options: TestActionOptions.options(
                    coverage: true,
                    codeCoverageTargets: [
                        TargetReference(stringLiteral: "Snowman")
                    ]
                )
            )
        )
    ],
    resourceSynthesizers: []
)
