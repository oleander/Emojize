import Foundation

public struct AttrElem: Equatable, CustomStringConvertible {
  public var description: String { return attr.string }
  let attr: NSMutableAttributedString

  var string: String {
    return attr.string
  }

  init(string: String) {
    self.init(attr: Mute(withDefaultFont: string))
  }

  init(attr: Mute) {
    self.attr = attr
  }

  init(attr: NSAttributedString) {
    self.attr = NSMutableAttributedString(attributedString: attr)
  }

  public static func + (lhs: AttrElem, rhs: AttrElem) -> AttrElem {
    return AttrElem(attr: lhs.attr + rhs.attr)
  }

  public static func == (lhs: AttrElem, rhs: AttrElem) -> Bool {
    return lhs.attr.string == rhs.attr.string
  }

  public static func == (lhs: Character, rhs: AttrElem) -> Bool {
   return String(lhs) == rhs.attr.string
  }

  public static func == (lhs: AttrElem, rhs: Character) -> Bool {
   return rhs == lhs
  }

  public static func + (lhs: Mute, rhs: AttrElem) -> Mute {
    lhs.append(rhs.attr)
    return lhs
  }

  public static func + (lhs: AttrElem, rhs: Mute) -> Mute {
    return rhs + lhs
  }
}
