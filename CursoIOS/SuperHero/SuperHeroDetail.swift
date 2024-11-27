//
//  SuperHeroDetail.swift
//  CursoIOS
//
//  Created by Joqtan on 26/11/24.
//

import Charts
import SDWebImageSwiftUI
import SwiftUI

struct SuperHeroDetail: View {

    @State var heroDetail: ApiNetwork.SuperHeroDetailed? = nil
    @State var loading: Bool = true
    let heroId: Int

    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            } else if let heroDetail = heroDetail {
                WebImage(url: URL(string: heroDetail.image.url))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                Text(heroDetail.name)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title)
                ForEach(heroDetail.biography.aliases, id: \.self) { alias in
                    Text(alias)
                        .foregroundStyle(.white)
                        .italic()
                }
                HeroStats(stats: heroDetail.powerstats)
                Spacer()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgApp)
        .onAppear {
            Task {
                do {
                    heroDetail = try await ApiNetwork().getHeroById(
                        heroId: heroId
                    )
                } catch {
                    print(
                        "Error al obtener los datos del heroe con Id \(heroId)"
                    )
                    print(error.localizedDescription)
                }
                loading = false
            }
        }
    }
}

struct HeroStats: View {

    let stats: ApiNetwork.Powerstats

    var body: some View {
        VStack {
            Chart {
                
                SectorMark(
                    angle: .value("Count", Int(stats.combat) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Combat")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.durability) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Durability")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.intelligence) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Intelligence")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.combat) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "combat")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.power) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Power")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.speed) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Speed")
                    )
                
                SectorMark(
                    angle: .value("Count", Int(stats.strength) ?? 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(
                        by: .value("Category", "Strength")
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(32)
    }
}

#Preview {
    SuperHeroDetail(heroId: 619)
}
