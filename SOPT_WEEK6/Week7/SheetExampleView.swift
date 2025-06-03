import SwiftUI

struct SheetExampleView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.title)
            Button("시트 열기") {
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented) {
                SheetDetailView(isPresented: $isSheetPresented)
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.medium])
        }
    }
}
