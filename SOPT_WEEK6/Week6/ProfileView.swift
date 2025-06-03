import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("doosan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            HStack {
                VStack(alignment: .leading) {
                    Text("두산 베어스")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("곧 올라갈거야...")
                        .font(.subheadline)
                        .foregroundStyle(.mint)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.gray
                .colorInvert()
                .opacity(0.75))
        }
    }
}

#Preview {
    ProfileView()
}
