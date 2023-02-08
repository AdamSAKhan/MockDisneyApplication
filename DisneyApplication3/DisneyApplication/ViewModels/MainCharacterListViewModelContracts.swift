//
//  MainCharacterListViewModelContracts.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

protocol DisneyCharactersViewModelOutput {
    /// Array of characters required for View
    var disneyCharacters: [DisneyCharacter] {get}
    /// A seperate array for the filtered Results
    var filteredArray: [DisneyCharacter] {get}
    /// Store the network error if it occurs
    var networkError: Error? {get}
}

protocol DisneyCharactersViewModelActions {
    /// Sorting lists from a parent dataset into filteredArray
    func sortCharacter(by name: String)
    /// Request Object
    /// Downloading the disney Characters
    func getDisneyCharacters(for request: Request) async
}
