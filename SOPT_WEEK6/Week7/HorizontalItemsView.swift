import SwiftUI

struct HorizontalItemsView: View {
    let rows = [GridItem(.fixed(75)), GridItem(.fixed(75))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(1...20, id: \.self) { value in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .frame(width: 75, height: 75)
                        
                        Text("\(value)")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}
