//
//  DisneycharacterModel.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

// MARK: - Welcome
/// Contains a lst of all of the Disney characters
struct DisneyResponse: Decodable, Equatable {
    let data: [DisneyCharacter]
    let count, totalPages: Int
    let nextPage: String
}

// MARK: Disney character
/// Contains a single disney characters information
struct DisneyCharacter: Decodable, Equatable, Hashable, Comparable {
  
    /// Additional Appearrences
    let films, shortFilms, tvShows, videoGames: [String]
    /// Attractions within the disney theme park
    let parkAttractions: [String]
    /// Primary Key
    let id: Int
    /// Character Name
    let name: String
    /// Image of the Disney Character
    let imageURL: String
    /// URL of the specific Disney character
    let url: String

    /// Needed to convert id and imageURL to correct format
    enum CodingKeys: String, CodingKey {
        case films, shortFilms, tvShows, videoGames, parkAttractions
        case id = "_id"
        case name
        case imageURL = "imageUrl"
        case url
    }
    
    static func == (lhs: DisneyCharacter, rhs: DisneyCharacter) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: DisneyCharacter, rhs: DisneyCharacter) -> Bool {
        lhs.name < rhs.name
    }
}
