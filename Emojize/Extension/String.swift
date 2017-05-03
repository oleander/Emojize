public extension String {
  public var emojified: String {
    let (output, _) = try! pparser.parse(AnyCollection(Attr(string: self)))
    return output.reduce(Mute(string: "")) { acc, el in acc + el }.string
  }
}
