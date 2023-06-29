import XCTest
@testable import Catury

@MainActor
final class CatsViewModelTests: XCTestCase {

  // MARK: - Properties

  // swiftlint:disable:next implicitly_unwrapped_optional
  private var viewModel: CatsViewModel!

  @MainActor
  override func setUp() {
    super.setUp()

    viewModel = CatsViewModel(
      isLoading: true,
      catsFetcher: CatsFetcherMock()
    )
  }

  override func tearDown() {
    super.tearDown()
  }

  func testFetchCatsLoadingState() async {
    XCTAssertTrue(viewModel.isLoading, "The view model should be loading, but it isn't")
    await viewModel.fetchCats()
    XCTAssertFalse(viewModel.isLoading, "The view model shouldn't be loading, but it is")
  }

  func testUpdatePageOnFetchMoreCats() async {
    XCTAssertEqual(viewModel.page,
      0,
      "the view model's page property should be 0 before fetching, but it's \(viewModel.page)"
    )

    await viewModel.fetchMoreCats()

    XCTAssertEqual(
      viewModel.page,
      1,
      "the view model's page property should be 1 after fetching, but it's \(viewModel.page)"
    )
  }

  func testFetchCatsEmptyResponse() async {
    viewModel = CatsViewModel(
      isLoading: true,
      catsFetcher: EmptyResponseCatsFetcherMock()
    )

    await viewModel.fetchCats()

    XCTAssertFalse(
      viewModel.hasMoreCats,
      "hasMorCats should be false with an empty response, but it's true"
    )

    XCTAssertFalse(
      viewModel.isLoading,
      "the view model shouldn't be loading after receivng an empty response, but it is"
    )
  }
}

struct EmptyResponseCatsFetcherMock: CatsFetcher {
  func fetchCats(page: Int) async -> Cats {
    []
  }
}
