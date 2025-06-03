import SwiftUI

struct SheetDetailView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("시트 뷰")
                    .font(.title)
                Button("닫기") {
                    isPresented = false
                }
                .padding()
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(.capsule)
            }
        }
    }
}
