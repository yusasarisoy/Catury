struct CatsFetcherMock: CatsFetcher {
  func fetchCats(page: Int) async -> Cats {
    Cat.mock
  }
}
