enum Match<T>: CustomStringConvertible {
  case data(T)
  case colon

  public var description: String {
    switch self {
    case let .data(data):
      return "[data: \(data)]"
    case .colon:
      return "[colon]"
    }
  }
}
