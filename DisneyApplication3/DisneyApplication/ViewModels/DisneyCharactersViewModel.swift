//
//  MainCharacterListViewViewModel.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

/// The VM for the DisneyCharacter List View
@MainActor
internal final class DisneyCharactersViewModel: ObservableObject {
    /// Array of characters required for View List
    @Published private(set) var disneyCharacters: [DisneyCharacter] = []
    /// Filterning the array for a specified Disney character
    @Published private(set) var filteredArray: [DisneyCharacter] = []
    /// Store the any error throwen from service layer
    @Published var networkError: Error?
    /// data service layer to get data
    private var service: Service
    init(_ service: Service) {
        self.service = service
    }
}
extension DisneyCharactersViewModel: DisneyCharactersViewModelActions {
    /// Getting the disney Characters
    func getDisneyCharacters(for request: Request) async {
            do {
                let disneyResponse = try await service.get(request: request, type: DisneyResponse.self)
                    self.disneyCharacters = disneyResponse.data
            }
            catch {
                    self.networkError = error
            }
    }
    /// Filter characters to match name
    func sortCharacter(by name: String) {
        self.filteredArray = disneyCharacters.filter{$0.name.hasPrefix(name)
        }
    }
}
