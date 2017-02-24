import PackageDescription

let package = Package(
  name: "Emojize",
  dependencies: [
    .Package(
      url: "https://github.com/oleander/FootlessParser-1.git",
      majorVersion: 0,
      minor: 3
    ),
    .Package(
      url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
      versions: Version(1,0,0)..<Version(3, .max, .max)
    ),
    .Package(
      url: "https://github.com/JohnSundell/Files.git",
      Version(1, 4, 0)
    ),
    .Package(url: "https://github.com/Quick/Quick", majorVersion: 1, minor: 1),
    .Package(url: "https://github.com/Quick/Nimble", majorVersion: 6)
  ]
)
