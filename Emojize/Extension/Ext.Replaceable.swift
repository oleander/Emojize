import Foundation
import FootlessParser

private let data: Parser<Character, Item> = Item.data <^> oneOrMore(noneOf([":"]))
private let colon: Parser<Character, Item> = pure(Item.colon) <* oneOf([":"])
private let parser = zeroOrMore(data <|> colon)

extension Replaceable {
  func declassify(using replace: @escaping (String) -> Character?) -> [Hit] {
    return iterator(result: classified, output: (0, [])) { a, b, c in
      switch (a, b, c) {
      case let (.colon, .data(data), .colon):
        return replace(data)
      default:
        return nil
      }
    }.1
  }

  private var classified: [Item] {
    do {
      return try parser.parse(AnyCollection(self.string.characters)).0
    } catch (let error) {
      print("[Error] Received error parsing: \(error)")
      return []
    }
  }

  private func iterator(result: [Item], output: Output, block: (Item, Item, Item) -> Character?) -> Output {
    if result.count < 3 { return output }
    let (startIndex, items) = output
    switch block(result[0], result[1], result[2]) {
    case let .some(emoji):
      let lengthOfItems = result[0].count + result[1].count + result[2].count
      let range = NSRange(location: startIndex, length: lengthOfItems)
      // The size of emoji == 1, + 1 to be used as the next position
      let newIndexToBeUsed = startIndex + 2
      return iterator(
        result: from(for: result, from: 3),
        output: (newIndexToBeUsed, items + [(emoji, range)]),
        block: block
      )
    case .none:
      let newOutput = (startIndex + result[0].count, items)
      return iterator(
        result: from(for: result, from: 1),
        output: newOutput,
        block: block
      )
    }
  }

  private func from(for array: [Item], from: Int) -> [Item] {
    return Array(array.dropFirst(from))
  }
}
