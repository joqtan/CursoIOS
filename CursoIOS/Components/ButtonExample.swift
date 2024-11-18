//
//  ButtonExample.swift
//  CursoIOS
//
//  Created by Joqtan on 17/11/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hello, World!") {
            print("Hello, World!")
        }
        
        Button(action: {
            print("Hello, World!")
        }, label: {
            Text("Hello, World!")
                .frame(width: 120, height: 50)
                .foregroundStyle(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter:View {
    
    @State var count:Int = 0
    
    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            Text("Count: \(count)")
                .bold()
                .frame(height: 50)
        })
        .padding(5)
        .foregroundStyle(.white)
        .background(.blue)
        .cornerRadius(10)
        
    }
}

#Preview {
    Counter()
}
