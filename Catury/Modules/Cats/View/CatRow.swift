import SwiftUI

struct CatRow: View {

  // MARK: - Properties

  let cat: Cat

  // MARK: - Body

  var body: some View {
    HStack {
      if let url = cat.image?.url {
        AsyncImage(url: URL(string: url)) { image in
          image
            .resizable()
        } placeholder: {
          ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.4))
            .clipShape(Circle())
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 100)
        .clipShape(Circle())
      }

      VStack(alignment: .leading) {
        Text(cat.name ?? "No name available")
          .multilineTextAlignment(.center)
          .font(.title3)

        Text(cat.description ?? "No description available")
          .lineLimit(.none)
          .font(.caption2)
      }
      .lineLimit(1)
    }
  }
}

// MARK: - Previews

struct CatRow_Previews: PreviewProvider {
  static var previews: some View {
    if let cat = Cat.mock.first {
      CatRow(cat: cat)
    }
  }
}
