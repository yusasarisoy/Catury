// MARK: - CatsFetcher

protocol CatsFetcher {
  func fetchCats(page: Int) async -> Cats
}
