import Foundation

public extension NSAttributedString {
  public var emojified: NSAttributedString {
    let (output, _) = try! pparser.parse(AnyCollection(Attr(attr: self)))
    return output.reduce(Mute(withDefaultFont: "")) { acc, el in acc + el }
  }
}
