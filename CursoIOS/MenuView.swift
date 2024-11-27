//
//  MenuView.swift
//  CursoIOS
//
//  Created by Joqtan on 18/11/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Apps")) {
                    NavigationLink(destination: IMCView()) {
                        Text("IMC Calculator")
                    }
                    NavigationLink(destination: SuperHeroFinder()) {
                        Text("SuperHero Finder")
                    }
                    Text("App3")
                    Text("App4")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
