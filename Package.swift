// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Emojize",
    dependencies: [
      .Package(url: "git@github.com:JohnSundell/Files.git", majorVersion: 1),
      .Package(url: "git@github.com:SwiftyJSON/SwiftyJSON.git", majorVersion: 3),
      .Package(url: "git@github.com:oleander/SwiftyTimer.git", majorVersion: 2),
      .Package(url: "git@github.com:oleander/FootlessParser.git", majorVersion: 2),
      .Package(url: "git@github.com:Quick/Quick.git", majorVersion: 1),
      .Package(url: "git@github.com:Quick/Nimble.git", majorVersion: 6)
    ]
)
