//
//  ContentView.swift
//  CursoIOS
//
//  Created by Joqtan on 16/11/24.
//

import SwiftUI

struct Exercise1Layout: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)

            }.frame(height: 100)
            
            Rectangle().foregroundColor(.orange).frame(height: 100)
            
            HStack {
                Circle().foregroundColor(.green)
                Rectangle().frame(height: 250)
                Circle().foregroundColor(.purple)
            }.background(.red)
            
            Rectangle().foregroundColor(.orange).frame(height: 100)
            
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
        }
        .background(Color.red)
    }
}

#Preview {
    Exercise1Layout()
}
