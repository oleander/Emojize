import Foundation

protocol Replaceable {
  func replaceCharacters(in range: NSRange, with str: String)
  func beginEditing()
  func endEditing()
  var string: String { get }
}
