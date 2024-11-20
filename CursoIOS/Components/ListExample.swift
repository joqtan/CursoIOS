//
//  ListExample.swift
//  CursoIOS
//
//  Created by Joqtan on 19/11/24.
//

import SwiftUI

struct ListExample: View {

    let creatures: [Creature] = [
        Creature(name: "example"),
        Creature(name: "example1"),
        Creature(name: "example2"),
    ]

    var body: some View {
        //        List {
        //            ForEach(creatures, id: \.name) { creature in
        //                Text(creature.name)
        //            }
        //        }

        List(creatures) { creature in
            Text(creature.name)
        }

        List {
            Section(header: Text("Creatures")) {
                ForEach(creatures, id: \.name) { creature in
                    Text(creature.name)
                }
            }
        }.listStyle(.sidebar)
    }
}

//struct Creature {
//    let name: String
//}

struct Creature: Identifiable {
    let id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
