import SwiftyJSON
import Foundation
import FootlessParser
import AppKit
import Files

typealias Hit = (Character, NSRange)
typealias Output = (Int, [Hit])
internal class Nothing {}
private let emojis = prefetchedEmojis

var path: String {
  return Bundle(for: type(of: Nothing()))
    .path(forResource: "emoji", ofType: "json")!
}

func process<T: Replaceable>(_ item: T) -> T {
  item.beginEditing()
  for (emoji, range) in item.declassify(using: { emojis[$0] }) {
    item.replaceCharacters(in: range, with: String(emoji))
  }
  item.endEditing()
  return item
}

var rawData: Data? {
  do {
    return try Files.File(path: path).read()
  } catch {
    return nil
  }
}

var prefetchedEmojis: [String: Character] {
  guard let data = rawData else {
    return [:]
  }

  let emojis = JSON(data: data)
  var replacements = [String: Character]()

  for emojize in emojis.arrayValue {
    for name in emojize["short_names"].arrayValue {
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
