// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PasswordGen",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "pg", targets: ["PasswordGen"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "PasswordGen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
        ),
        .testTarget(
            name: "PasswordGenTests",
            dependencies: ["PasswordGen"]
        ),
    ]
)
