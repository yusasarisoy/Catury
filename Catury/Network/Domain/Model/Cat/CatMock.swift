import Foundation

// MARK: - Mock data

extension Cat {
  static let mock = loadCats()
}

private struct CatsMock: Decodable {
  let cats: Cats
}

private func loadCats() -> Cats {
  guard
    let url = Bundle.main.url(forResource: "CatsMock", withExtension: "json"),
    let data = try? Data(contentsOf: url)
  else {
    return []
  }

  let decoder = JSONDecoder()
  decoder.keyDecodingStrategy = .convertFromSnakeCase
  let jsonMock = try? decoder.decode(CatsMock.self, from: data)
  return jsonMock?.cats ?? []
}
