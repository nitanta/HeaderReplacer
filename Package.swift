// swift-tools-version:5.5.0
import PackageDescription

let package = Package(
    name: "HeaderReplacer",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "HeaderReplacer",
            dependencies: []),
        .testTarget(
            name: "HeaderReplacerTests",
            dependencies: ["HeaderReplacer"]),
    ]
)