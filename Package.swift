// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SharedKitV",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "SharedKitV",
      targets: ["SharedKitV"]
    ),
  ],
  targets: [
    .target(
      name: "SharedKitV",
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency"),
      ]
    ),
    .testTarget(
      name: "SharedKitVTests",
      dependencies: ["SharedKitV"]
    ),
  ]
)
