//
//  ContentView.swift
//  SOPT_WEEK6
//
//  Created by APPLE on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = "현수"
    
    var body: some View {
        VStack {
            Text(name)
            Button(action: {
                if self.name == "현수" {
                    self.name = "나연"
                    return
                }
                self.name = "현수"
            }) {
                Text("이름 바꾸기")
            }
        }
    }
}

#Preview {
    ContentView()
}
