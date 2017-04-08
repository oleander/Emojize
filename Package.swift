// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "Emojize",
  targets: [
    Target(name: "Emojize"),
    Target(name: "EmojizeTests", dependencies: ["Emojize"])
  ]
)
