//
//  SuperHeroSearch.swift
//  CursoIOS
//
//  Created by Joqtan on 19/11/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct SuperHeroFinder: View {

    @State var inputValue: String = ""
    @State var heroes: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false

    var body: some View {

        VStack {
            TextField(
                "",
                text: $inputValue,
                prompt: Text("SuperHero Name")
                    .bold()
                    .foregroundStyle(.gray)
                    .font(.title2)
            )
            .bold()
            .font(.title2)
            .foregroundStyle(.black)
            .padding(16)
            .background(.white)
            .clipShape(.buttonBorder)
            .padding(32)
            .autocorrectionDisabled()
            .onSubmit {
                Task {
                    loading = true
                    do {
                        heroes = try await ApiNetwork().getHeroesByQuery(
                            query: (inputValue))
                    } catch {
                        print("error")
                    }
                    loading = false
                }
            }

            if loading {
                ProgressView().tint(.white)
            }

            NavigationStack {

                List(heroes?.results ?? []) { hero in

                    ZStack {

                        SuperHeroItem(superHero: hero)
                        NavigationLink(destination: SuperHeroDetail(heroId: Int(hero.id)!)) {
                            EmptyView()
                        }.opacity(0)
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.bgApp)

                }
                .listStyle(.plain)
                .background(.bgApp)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgApp)
    }
}

struct SuperHeroItem: View {

    let superHero: ApiNetwork.Superhero

    var body: some View {
        ZStack {
            WebImage(url: URL(string: superHero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
                .offset(y: 80)
            //            RemoteView(url: URL(string: superHero.image.url)!)
            //                .frame(maxWidth:.infinity)
            VStack {
                Spacer()
                Text(superHero.name)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
            }

        }
        .frame(height: 200)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )

    }
}

struct RemoteView: View {
    let url: URL
    @State var uiImage: UIImage? = nil

    var body: some View {

        if let uiImage = uiImage {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
        } else {

            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }

    func loadImage() {
        Task {
            do {
                print(url)
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.uiImage = image
                    }
                }
            } catch {
                print(
                    "Error al cargar la imagen: \(error.localizedDescription)")
            }
        }
    }

}

#Preview {
    SuperHeroFinder()
}
