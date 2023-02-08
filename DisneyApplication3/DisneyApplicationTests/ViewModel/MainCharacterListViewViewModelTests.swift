//
//  MainCharacterListViewViewModelTests.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import XCTest
@testable import DisneyApplication


final class DisneyCharactersViewModelTests: XCTestCase {

    var disneyCharactersViewModel: DisneyCharactersViewModel?
  
    override func tearDown() {
        disneyCharactersViewModel = nil
    }
    
    @MainActor
    func testGetCharactersWhenReceivedResponse() async {
        // GIVEN
        let mockResponse = DisneyResponse.mockResponse()
        let mockDataService = MockDataService(disneyResponse: mockResponse)
        disneyCharactersViewModel =  DisneyCharactersViewModel(mockDataService)
        // When
        await disneyCharactersViewModel?.getDisneyCharacters(for: DisneyRequest())
        // Then
        XCTAssertEqual(disneyCharactersViewModel?.disneyCharacters.count, mockResponse.data.count)
    }
    
    @MainActor
    func testGetCharactersWhenReceivedError() async {
        // GIVEN
        let mockDataService = MockDataService()
        disneyCharactersViewModel =  DisneyCharactersViewModel(mockDataService)
        // When
        await disneyCharactersViewModel?.getDisneyCharacters(for: DisneyRequest())
        // Then
        XCTAssertNotNil(self.disneyCharactersViewModel?.networkError)
    }
    
    @MainActor
    func testSortCharacters() async {
        // GIVEN
        let mockResponse = DisneyResponse.mockResponse()
        let mockDataService = MockDataService(disneyResponse: mockResponse)
        disneyCharactersViewModel =  DisneyCharactersViewModel(mockDataService)
        await disneyCharactersViewModel?.getDisneyCharacters(for: DisneyRequest())
        
        // When
        disneyCharactersViewModel?.sortCharacter(by: "Abi")
        // Then
        XCTAssertEqual(      disneyCharactersViewModel?.disneyCharacters.count
                             , mockResponse.data.count)
        
        XCTAssertEqual(disneyCharactersViewModel?.filteredArray.count, 2)
        
        XCTAssertTrue(disneyCharactersViewModel!.filteredArray.first!.name.contains("Abi"))
    }
}

extension DisneyResponse {
    static func mockResponse() -> DisneyResponse {
        return DisneyResponse(data: [
            DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 19, name: "Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/d/dd/Regalblond.jpg", url: "https://api.disneyapi.dev/characters/19"),
            DisneyCharacter(films: [], shortFilms: [], tvShows: ["Elena of Avalor"], videoGames: [], parkAttractions: [], id: 20, name: "Queen Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/f/fa/Normal_EoA_S3_E4_0217.jpg", url: "https://api.disneyapi.dev/characters/20"),
            DisneyCharacter(films: ["The Return of Jafar","Aladdin and the King of Thieves"], shortFilms: [], tvShows: ["Aladdin (TV series)"], videoGames: [], parkAttractions: [], id: 21, name: "Abis Mal's Thugs", imageURL: "https://static.wikia.nocookie.net/disney/images/b/ba/Abis_Mal%27s_Thugs.jpg", url: "https://api.disneyapi.dev/characters/21")]
        , count: 3, totalPages: 1, nextPage: "2")
    }
}
