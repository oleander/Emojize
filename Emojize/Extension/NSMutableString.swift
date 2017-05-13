import Foundation

extension NSMutableString: Replaceable {
  var string: String { return self as String }
  func beginEditing() {}
  func endEditing() {}
}
