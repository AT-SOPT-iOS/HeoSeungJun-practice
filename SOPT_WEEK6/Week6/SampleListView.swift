import SwiftUI

struct SampleListView: View {
    let items: [ChatModel] = chatDummy
    var body: some View {
        List(items) { item in
            HStack {
                Image("doosan")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(.circle)
                    .padding(8)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(item.location)
                            .font(.caption)
                    }
                    .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                    
                    Text(item.message)
                        .font(.caption)
                }
                
                Spacer()
                
                Image(item.profileImageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(3)
            }
        }
        .listStyle(PlainListStyle())
        
    }
}

#Preview {
    SampleListView()
}
