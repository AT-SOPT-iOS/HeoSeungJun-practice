import SwiftUI

struct ProductCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image("phone")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(4)
                Image("heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(8)
            }
            
            HStack {
                Text("아이폰 13프로맥스")
                    .font(.title3)
                
                Text("길동")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Text("1,000,000원")
                .foregroundStyle(.orange)
                .font(.title3)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    ProductCellView()
}
