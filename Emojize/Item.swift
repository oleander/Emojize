enum Item: CustomStringConvertible {
  case colon
  case data(String)

  var count: Int {
    switch self {
    case .colon:
      return 1
    case let .data(data):
      return data.characters.count
    }
  }

  public var description: String {
    switch self {
    case .colon:
      return ":"
    case let .data(string):
      return string
    }
  }
}