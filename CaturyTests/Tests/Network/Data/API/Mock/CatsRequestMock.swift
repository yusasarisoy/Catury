import Foundation
@testable import Catury

enum CatsRequestMock: RequestProtocol {
  case getCats

  var requestType: RequestType {
    .GET
  }

  var path: String {
    guard let path = Bundle.main.path(forResource: "CatsMock", ofType: "json") else { return "" }
    return path
  }
}
