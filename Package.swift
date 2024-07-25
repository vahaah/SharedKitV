// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SharedKit",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "SharedKit",
      targets: ["SharedKit"]
    ),
  ],
  targets: [
    .target(
      name: "SharedKit",
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency"),
      ]
    ),
    .testTarget(
      name: "SharedKitTests",
      dependencies: ["SharedKit"]
    ),
  ]
)
