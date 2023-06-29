import Foundation

// MARK: - CatsFetcher

protocol CatsFetcher {
  func fetchCats(page: Int) async -> Cats
}

@MainActor
final class CatsViewModel: ObservableObject {

  // MARK: - Properties

  @Published var isLoading: Bool
  @Published var hasMoreCats = true
  @Published var cats: Cats = []

  private let catsFetcher: CatsFetcher
  private(set) var page = 0

  // MARK: - Initialization

  init(
    isLoading: Bool = true,
    catsFetcher: CatsFetcher
  ) {
    self.isLoading = isLoading
    self.catsFetcher = catsFetcher
  }
}

// MARK: - Internal Helper Methods

extension CatsViewModel {
  func fetchCats() async {
    isLoading = true
    let cats = await catsFetcher.fetchCats(page: page)
    self.cats += cats
    isLoading = false
    hasMoreCats = !cats.isEmpty
  }

  func fetchMoreCats() async {
    page += 1
    await fetchCats()
  }
}
