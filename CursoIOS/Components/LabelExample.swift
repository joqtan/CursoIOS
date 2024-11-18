//
//  LabelExample.swift
//  CursoIOS
//
//  Created by Joqtan on 17/11/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label(
            title: {
                Text("Hello, World!")
            },
            icon: {
                Image("swiftui")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
            }
        )
    }
}

#Preview {
    LabelExample()
}
