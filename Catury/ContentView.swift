import SwiftUI

struct ContentView: View {
  var body: some View {
    CatsView(
      viewModel: .init(
        catsFetcher: FetchCatsService(
          requestManager: RequestManager()
        )
      )
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
