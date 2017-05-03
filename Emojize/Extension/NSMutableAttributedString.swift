import Foundation

public typealias Attr = NSMutableAttributedString
public typealias Mute = NSMutableAttributedString

extension NSMutableAttributedString: Collection {
  convenience init(attr: NSAttributedString) {
    self.init(attributedString: attr)
  }

  public static func + (lhs: Mute, rhs: String) -> Mute {
    return lhs + Mute(string: rhs)
  }

  public static func + (lhs: String, rhs: Mute) -> Mute {
    return rhs + lhs
  }

  public func index(after i: Int) -> Int {
    return i + 1
  }

  public subscript(position: Int) -> AttrElem {
    return AttrElem(attr: attributedSubstring(from: NSRange(location: position, length: 1)))
  }

  public static func + (lhs: Attr, rhs: Attr) -> Attr {
    lhs.append(rhs)
    return lhs
  }

  public var endIndex: Int {
    return length
  }

  public static func == (lhs: Attr, rhs: String) -> Bool {
    return lhs.string == rhs
  }

  public static func == (lhs: String, rhs: Attr) -> Bool {
    return rhs == lhs
  }

  public var startIndex: Int {
    return 0
  }

  public func makeIterator() -> IndexingIterator<Attr> {
    return IndexingIterator(_elements: self)
  }

  public typealias Index = Int
  public typealias _Element = AttrElem
}
