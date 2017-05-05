public extension String {
  public var emojified: String {
    let (output, _) = try! pparser.parse(AnyCollection(Attr(withDefaultFont: self)))
    return output.reduce(Mute(withDefaultFont: "")) { acc, el in acc + el }.string
  }
}
