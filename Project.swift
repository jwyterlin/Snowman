import ProjectDescription

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
            entitlements: .file(path: Path.relativeToRoot("Snowman/Snowman.entitlements")),
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
