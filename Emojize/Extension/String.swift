import Foundation

public extension String {
  public var emojified: String {
    return process(NSMutableString(string: self)).string
  }
}
