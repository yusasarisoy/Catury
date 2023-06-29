import Foundation

// MARK: - FetchCatsService

struct FetchCatsService {

  // MARK: - Properties

  private let requestManager: RequestManagerProtocol

  // MARK: - Initialization

  init(requestManager: RequestManagerProtocol) {
    self.requestManager = requestManager
  }
}

// MARK: - CatsFetcher

extension FetchCatsService: CatsFetcher {
  func fetchCats(page: Int) async -> Cats {
    let requestData = CatsRequest.fetchCats(page)
    do {
      let cats: Cats = try await requestManager.perform(requestData)
      return cats
    } catch {
      print(error.localizedDescription)
      return []
    }
  }
}
