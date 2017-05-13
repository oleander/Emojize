import Foundation

public extension NSAttributedString {
  public var emojified: NSAttributedString {
    return process(NSMutableAttributedString(attributedString: self))
  }
}
