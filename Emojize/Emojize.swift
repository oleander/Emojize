import SwiftyJSON
import FootlessParser
import AppKit
import Files

internal class Nothing {}

private typealias P<T> = Parser<AttrElem, T>
private typealias Elem = Match<AttrElem>
private let emojis = load()
private let data: P<Elem> = Match.data <^> til([AttrElem(string: ":")])
private let colon: P<Elem> = pure(Match.colon) <* oneOf(Attr(withDefaultFont: ":"))
internal let pparser = parser(forChar)

var path: String {
  return Bundle(for: type(of: Nothing()))
    .path(forResource: "emoji", ofType: "json")!
}

private func parser(_ replace: @escaping (String) -> String?) -> P<Attr> {
  return { process($0, replace) } <^> zeroOrMore(data <|> colon)
}

private func reduce(array: [AttrElem]) -> AttrElem {
  return array.reduce(AttrElem(string: "")) { $0 + $1 }
}

private func iterator(_ ma: [Elem], block: (Elem, Elem, Elem) -> State) -> [Elem] {
  if ma.count < 3 { return ma }
  switch block(ma[0], ma[1], ma[2]) {
  case let .hit(attr):
    return [attr] + iterator(from(for: ma, from: 3), block: block)
  case .miss:
    return [ma[0]] + iterator(from(for: ma, from: 1), block: block)
  }
}

private func from(for array: [Elem], from: Int) -> [Elem] {
  return array.enumerated().reduce([]) { acc, el in
    if el.0 >= from { return acc + [el.1] }
    return acc
  }
}

private func process(_ ma: [Elem], _ replace: @escaping (String) -> String?) -> Attr {
  return iterator(ma) { a, b, c in
    switch (a, b, c) {
    case let (.colon, .data(data), .colon):
      if let more = replace(data.string) {
        return .hit(.data(AttrElem(string: more)))
      }
      return .miss
    default:
      return .miss
    }
  }.reduce(Attr(withDefaultFont: "")) { acc, el in
    switch el {
    case let .data(data):
      return acc + data
    case .colon:
      return acc + ":"
    }
  }
}

private func til(_ values: [AttrElem], empty: Bool = true) -> P<AttrElem> {
  return reduce <^> oneOrMore(noneOf(values))
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
