import SwiftUI

struct ItemsView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(1...10, id: \.self) { value in
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .frame(width: 100, height: 75)
                        
                        Text("아이템 \(value)")
                            .font(.caption)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                }
            }
        }
    }
}
