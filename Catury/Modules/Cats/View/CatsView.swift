import SwiftUI

struct CatsView: View {

  // MARK: - Properties

  @ObservedObject var viewModel: CatsViewModel

  // MARK: - Body

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.cats) { cat in
          CatRow(cat: cat)
        }
        if !viewModel.cats.isEmpty, viewModel.hasMoreCats {
          ProgressView("Finding more cats...")
            .padding()
            .frame(maxWidth: .infinity)
            .task {
              await viewModel.fetchMoreCats()
            }
        }
      }
      .task {
        await viewModel.fetchCats()
      }
      .listStyle(.plain)
      .navigationTitle("Cats")
      .overlay {
        if viewModel.isLoading && viewModel.cats.isEmpty {
          ProgressView("Finding Animals near you...")
        }
      }
    }
    .navigationViewStyle(.stack)
  }
}

// MARK: - Preview

struct CatsView_Previews: PreviewProvider {
  static var previews: some View {
    CatsView(
      viewModel: CatsViewModel(
        catsFetcher: CatsFetcherMock()
      )
    )
  }
}
