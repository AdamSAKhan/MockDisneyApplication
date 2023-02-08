//
//  StaticViewTestCharacter.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

/// For Use within the preview file
internal class DummyData {
    /// Singleton pattern
    static let shared: DummyData = DummyData()
    private init() {}
    
    let dummyCharacter: DisneyCharacter = DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 19, name: "Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/d/dd/Regalblond.jpg", url: "https://api.disneyapi.dev/characters/19")
    
    let dummyCharacters: [DisneyCharacter] = [
        DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 19, name: "Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/d/dd/Regalblond.jpg", url: "https://api.disneyapi.dev/characters/19"),
        DisneyCharacter(films: [], shortFilms: [], tvShows: ["Elena of Avalor"], videoGames: [], parkAttractions: [], id: 20, name: "Queen Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/f/fa/Normal_EoA_S3_E4_0217.jpg", url: "https://api.disneyapi.dev/characters/20"),
        DisneyCharacter(films: ["The Return of Jafar","Aladdin and the King of Thieves"], shortFilms: [], tvShows: ["Aladdin (TV series)"], videoGames: [], parkAttractions: [], id: 21, name: "Abis Mal's Thugs", imageURL: "https://static.wikia.nocookie.net/disney/images/b/ba/Abis_Mal%27s_Thugs.jpg", url: "https://api.disneyapi.dev/characters/21")
    ]
}
