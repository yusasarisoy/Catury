import XCTest
@testable import Catury

struct APIManagerMock: APIManagerProtocol {
  func perform(_ request: RequestProtocol) async throws -> Data {
    try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }
}
