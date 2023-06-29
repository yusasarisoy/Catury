import XCTest
@testable import Catury

final class RequestManagerMock {

  // MARK: - Properties

  let apiManager: APIManagerProtocol
  let parser: DataParserProtocol

  // MARK: - Initialization

  init(
    apiManager: APIManagerProtocol,
    parser: DataParserProtocol = DataParser()
  ) {
    self.apiManager = apiManager
    self.parser = parser
  }
}

// MARK: - RequestManagerProtocol

extension RequestManagerMock: RequestManagerProtocol {
  func perform<Element: Decodable>(_ request: RequestProtocol) async throws -> Element {
    let data = try await apiManager.perform(request)
    let decoded: Element = try parser.parse(data: data)
    return decoded
  }
}
