import SwiftyJSON
import FootlessParser
import AppKit
import Files

private typealias P<T> = Parser<Character, T>

// let bundle = Bundle.main
// var path: String {
//   return Bundle.main.path(forResource: "emoji", ofType: "json")!
// }

func recursivePathsForResources(type: String)  {
  // Get the document directory url
  // let documentsUrl =  FileManager.default.urls(for: Bundle.main, in: .userDomainMask).first!
  //
  // do {
  //   // Get the directory contents urls (including subfolders urls)
  //   let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
  //   print(directoryContents)
  //
  //   // if you want to filter the directory contents you can do like this:
  //   let mp3Files = directoryContents.filter{ $0.pathExtension == "json" }
  //   print("mp3 urls:",mp3Files)
  //   let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
  //   print("mp3 list:", mp3FileNames)
  //
  // } catch let error as NSError {
  //   print(error.localizedDescription)
  // }

  dump(Bundle.main.paths(forResourcesOfType: nil, inDirectory: "."))
}

class Hello {

}
var path: String {
  recursivePathsForResources(type: "json")
  // return Bundle(bundleForClass: Hello.self)
//  let b = Bundle(for: Emojize)
  // let b = Bundle(for: AnyClass.self as! AnyClass)

  // return Bundle()
  let bb = Bundle(identifier: "Hello")
  let ii = bb?.paths(forResourcesOfType: nil, inDirectory: nil, forLocalization: nil)
  // return b.path(forResource: "emoji", ofType: "json")!
  dump(ii)
  dump("kdkjsdlkfjsdlkfjlskdjfkjsf")
  for bundle in Bundle.allBundles {
//    dump(bundle.)
    dump("---------")
    dump(bundle.paths(forResourcesOfType: nil, inDirectory: nil))
  }
  // return Bundle.main.path(forResource: "emoji", ofType: "json")!
  return "X"

  // return Bundle.bundleForClass()
}

let emojis = load()
public extension String {
  public func emojifyed() -> String {
    do {
      return try parse(parser(replace: forChar), self)
    } catch (_) {
      return self
    }
  }
}

private func parser(replace: @escaping (String) -> String?) -> P<String> {
  func merge(pre: String, item: String, post: String) -> String {
    guard let result = replace(item) else {
      return pre + ":" + item + ":" + post
    }

    return pre + result + post
  }

  let emojize =
    curry(merge) <^>
    (til([":"]) <* string(":")) <*>
    (til([":"]) <* string(":")) <*>
    til([":"])
  let parser: P<[String]> = zeroOrMore(emojize)
  return curry({ $0.joined() + $1 }) <^> parser <*> zeroOrMore(any())
}

private func til(_ values: [String], empty: Bool = true) -> P<String> {
  return zeroOrMore(noneOf(values))
}

private func join(_ paths: String...) -> String {
  if paths.isEmpty { fatalError("Min 1 path, got zero") }
  if paths.count == 1 { return paths[0] }
  return paths[1..<paths.count].reduce(paths[0]) {
    URL(fileURLWithPath: $0).appendingPathComponent($1).path
  } as String
}

private func read() -> Data? {
  do {
    return try Files.File(path: path).read()
  } catch {
    return nil
  }
}

private func forChar(_ char: String) -> String? {
  guard let hex = emojis[char] else {
    return nil
  }

  guard let int = Int(hex, radix: 16) else {
    return nil
  }

  guard let unicode = UnicodeScalar(int) else {
    return nil
  }

  return String(describing: unicode)
}

private func load() -> [String: String] {
  guard let data = read() else {
    return [:]
  }

  let emojis = JSON(data: data)
  var replacements = [String: String]()

  for emojize in emojis.arrayValue {
    for name in emojize["short_names"].arrayValue {
      guard let char = emojize["unified"].string else {
        continue
      }

      if let key = name.string {
        replacements[key] = char
      }
    }
  }
  return replacements
}
