//
//  ApiNetwork.swift
//  CursoIOS
//
//  Created by Joqtan on 21/11/24.
//

import Foundation

class ApiNetwork {

    struct Wrapper: Codable {
        let response: String
        let results: [Superhero]
    }

    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageResponse
    }

    struct ImageResponse: Codable {
        let url: String
    }

    struct SuperHeroDetailed: Codable {
        let id: String
        let name: String
        let image: ImageResponse
        let powerstats: Powerstats
        let biography: Biography
    }

    struct Powerstats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }

    struct Biography: Codable {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String
        let alignment: String

        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case alterEgos = "alter-egos"
            case aliases = "aliases"
            case placeOfBirth = "place-of-birth"
            case firstAppearance = "first-appearance"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }

    func getHeroesByQuery(query: String) async throws -> Wrapper {

        let url: URL = URL(string: "\(urlBase)\(accessToken)/search/\(query)")!

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(Wrapper.self, from: data)

    }

    func getHeroById(heroId: Int) async throws -> SuperHeroDetailed {

        let url: URL = URL(string: "\(urlBase)\(accessToken)/\(heroId)")!

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(SuperHeroDetailed.self, from: data)
    }

    let urlBase: String = "https://superheroapi.com/api/"
    let accessToken: String = "a2a8a8c56a314ee97752c35c3b6e0529"

}
