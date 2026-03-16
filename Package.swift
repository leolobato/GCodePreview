// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GCodePreview",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "GCodePreview", targets: ["GCodePreview"])
    ],
    targets: [
        .target(
            name: "GCodePreview"
        )
    ]
)
