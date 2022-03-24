// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tools",
    products: [],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.47.0")
    ],
    targets: []
)
