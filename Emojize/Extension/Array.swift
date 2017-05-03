extension Array {
  func get(_ index: Int) -> Element? {
    if index < 0 { print("abort using: \(index)"); return nil }
    if count <= index { print("abort using \(index)"); return nil }
    return self[index]
  }
}
