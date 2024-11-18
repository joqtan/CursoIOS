//
//  ImageExample.swift
//  CursoIOS
//
//  Created by Joqtan on 17/11/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .frame(width: 50, height: 50)
        Image(systemName:"figure.outdoor.cycle")
            .resizable()
            .scaledToFit()
            .frame(width: 60)
    }
}

#Preview {
    ImageExample()
}
