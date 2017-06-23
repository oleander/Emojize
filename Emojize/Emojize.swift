import JASON
import Foundation
import FootlessParser
import AppKit

typealias Hit = (Character, NSRange)
typealias Output = (Int, [Hit])
internal class Nothing {}
private let emojis = prefetchedEmojis

var path: URL {
  return Bundle(for: type(of: Nothing()))
    .url(forResource: "emoji", withExtension: "json")!
}

func process<T: Replaceable>(_ item: T) -> T {
  item.beginEditing()
  for (emoji, range) in item.declassify(using: { emojis[$0] }) {
    item.replaceCharacters(in: range, with: String(emoji))
  }
  item.endEditing()
  return item
}

var rawData: String? {
  do {
    return try String(contentsOf: path, encoding: .utf8)
  } catch {
    return nil
  }
}

var prefetchedEmojis: [String: Character] {
  let emojis = JSON(rawData)
  var replacements = [String: Character]()

  for emojize in emojis.jsonArray ?? [] {
    for name in emojize["short_names"].jsonArray ?? [] {
      guard let hex = emojize["unified"].string else {
        continue
      }

      guard let key = name.string else {
        continue
      }

      guard let int = Int(hex, radix: 16) else {
        continue
      }

      guard let unicode = UnicodeScalar(int) else {
        continue
      }

      replacements[key] = Character(unicode)
    }
  }
  return replacements
}
