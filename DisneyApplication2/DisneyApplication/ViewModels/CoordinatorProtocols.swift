//
//  CoordinatorProtocols.swift
//  DisneyApplication
//
//  Created by Adam Khan on 25/01/2023.
//

import Foundation

/// The basic functionality required for the DisneyCharactrVM
protocol CoordinatorVMBasics {
    /// Array of characters required for View
    var disneyCharacters: [DisneyCharacter] {get set}
}

/// Sorting Captabillities for DisneyCharacterListVM
protocol CoordinatorVMSorting {
    /// A seperate array for the filtered Results
    var filteredArray: [DisneyCharacter] {get set}
    /// Sorting lists from a parent dataset into filteredArray
    func sortCharacterByName(_ name: String)
}

/// Networking capabillities
protocol CoordinatorNetworking {
    /// Object getting JSON data capabillities
    var networkClient: NetworkApiContract {get}
    /// Store the network error if it occurs
    var networkError: Error? {get set}
    /// Request Object
    var request: DisneyRequest {get set}
    /// Downloading the disney Characters
    func downloadDisneyCharacters() async
    /// Decoder
    func decode<T: Decodable>(_ data: Data, type: T.Type) throws -> T
}
