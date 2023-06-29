import XCTest
@testable import Catury

final class RequestManagerTests: XCTestCase {

  // MARK: - Properties

  private var requestManager: RequestManagerProtocol?

  override func setUp() {
    super.setUp()

    requestManager = RequestManagerMock(apiManager: APIManagerMock())
  }

  override func tearDown() {
    super.tearDown()

    requestManager = .none
  }

  func testRequestCats() async throws {
    guard let cats: Cats = try await requestManager?.perform(CatsRequestMock.getCats) else { return }
    let firstCat = cats.first
    let lastCat = cats.last

    XCTAssertEqual(firstCat?.name, "Ragamuffin")
    XCTAssertEqual(firstCat?.id, "raga")
    XCTAssertEqual(firstCat?.origin, "United States")

    XCTAssertEqual(lastCat?.name, "York Chocolate")
    XCTAssertEqual(lastCat?.id, "ycho")
    XCTAssertEqual(lastCat?.origin, "United States")
  }
}
