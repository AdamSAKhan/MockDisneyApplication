//
//  CoordinatorViewModel.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

/// The VM for the DisneyCharacter List View
internal final class CoordinatorVM: ObservableObject, CoordinatorVMBasics, CoordinatorVMSorting, CoordinatorNetworking {
    
    /// Array of characters required for View List
    @Published var disneyCharacters: [DisneyCharacter] = []
    /// Filterning the array for a specified Disney character
    @Published var filteredArray: [DisneyCharacter] = []
    /// Store the network error if it occurs
    @Published var networkError: Error?
    ///Object getting JSON
    var networkClient: NetworkApiContract
    ///Request Object
    var request: DisneyRequest
    
    init(_ networkClient: NetworkApiContract, request: DisneyRequest) {
        self.networkClient = networkClient
        self.request = request
    }
    
    /// Downloading the disney Characters
    /// Error catching not finished
    func downloadDisneyCharacters() async {
        do {
            let data = try await networkClient.get(request: request)
            do {
                let downloaded: DisneyResponse = try decode(data, type: DisneyResponse.self)
                DispatchQueue.main.async {
                    self.disneyCharacters = downloaded.data
                }
            }
            catch (let error){
                self.networkError = error
                return
            }
        }
        catch NetworkError.badResponse {
            self.networkError = NetworkError.badResponse
            return
        }
        catch (let error) {
            self.networkError = error
            return
        }
        
    }
    
    /// Decoding to Disney Characters
    func decode<T: Decodable>(_ data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    /// Filter characters to match name
    func sortCharacterByName(_ name: String) {
        self.filteredArray = []
        self.filteredArray = disneyCharacters.filter({ character in
            character.name.hasPrefix(name)
        })
    }
}
