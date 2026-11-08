// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "gps-swift",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .watchOS(.v26),
        .tvOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "GPSSwift", targets: ["GPSSwift"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GPSSwift",
            dependencies: [],
        ),
        .testTarget(
            name: "GPSSwiftTests",
            dependencies: ["GPSSwift"],
            resources: [.copy("Fixtures")],
        ),
    ]
)
