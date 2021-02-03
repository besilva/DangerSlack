// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DangerSlack",
    products: [
        .library(
            name: "DangerSlack",
            targets: ["DangerSlack"]),
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0") // dev
    ],
    targets: [
        .target(name: "DangerDependencies", dependencies: [.product(name: "Danger", package: "danger-swift"), "DangerSlack"], sources: ["Fake.swift"]),
        .target(
            name: "DangerSlack",
            dependencies: []),
        .testTarget(
            name: "DangerSlackTests",
            dependencies: ["DangerSlack"]),
    ]
)
