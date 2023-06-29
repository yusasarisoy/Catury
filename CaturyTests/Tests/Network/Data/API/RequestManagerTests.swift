import XCTest
@testable import Catury

final class RequestManagerTests: XCTestCase {

  // MARK: - Properties

  private var requestManager: RequestManagerProtocol?

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testRequestCats() async throws {
    guard let cats: Cats = try await requestManager?.perform(CatsRequestMock.getCats) else { return }
    let firstCat = cats.first
    let lastCat = cats.last

    XCTAssertEqual(firstCat?.name, "Ragamuffin")
    XCTAssertEqual(firstCat?.id, "raga")
    XCTAssertEqual(firstCat?.origin, "United States")

    XCTAssertEqual(firstCat?.name, "York Chocolate")
    XCTAssertEqual(firstCat?.id, "ycho")
    XCTAssertEqual(firstCat?.origin, "United States")
  }
}
