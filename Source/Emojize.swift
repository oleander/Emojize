import SwiftyJSON
import FootlessParser
import AppKit
import Files

private typealias P<T> = Parser<Character, T>

var path: String {
  return Bundle(for: type(of: Xa())).path(forResource: "emoji", ofType: "json")!
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
    print("AAAAAAA")
    for x in Bundle.allBundles {
      print(x)
      print("allBundlesallBundlesallBundlesallBundles")
    }


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
