//
//  ControllerTestCases.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 25/01/2023.
//

import XCTest
@testable import DisneyApplication


/// Testing the filterning capabillities of the CoordinatorVM
final class ControllerTestCases: XCTestCase {

    private var vc: CoordinatorVM?
    
    override func setUpWithError() throws {
        vc = CoordinatorVM(NetworkApiClient(), request: DisneyRequest())
    }

    override func tearDownWithError() throws {
        vc = nil
    }
    
    let dummyCharacters: [DisneyCharacter] = [
        DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 19, name: "Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/d/dd/Regalblond.jpg", url: "https://api.disneyapi.dev/characters/19"),
        DisneyCharacter(films: [], shortFilms: [], tvShows: ["Elena of Avalor"], videoGames: [], parkAttractions: [], id: 20, name: "Queen Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/f/fa/Normal_EoA_S3_E4_0217.jpg", url: "https://api.disneyapi.dev/characters/20"),
        DisneyCharacter(films: ["The Return of Jafar","Aladdin and the King of Thieves"], shortFilms: [], tvShows: ["Aladdin (TV series)"], videoGames: [], parkAttractions: [], id: 21, name: "Abis Mal's Thugs", imageURL: "https://static.wikia.nocookie.net/disney/images/b/ba/Abis_Mal%27s_Thugs.jpg", url: "https://api.disneyapi.dev/characters/21")]
    
    let response1: [DisneyCharacter] = [
        
    DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 19, name: "Abigail", imageURL: "https://static.wikia.nocookie.net/disney/images/d/dd/Regalblond.jpg", url: "https://api.disneyapi.dev/characters/19"),
    DisneyCharacter(films: ["The Return of Jafar","Aladdin and the King of Thieves"], shortFilms: [], tvShows: ["Aladdin (TV series)"], videoGames: [], parkAttractions: [], id: 21, name: "Abis Mal's Thugs", imageURL: "https://static.wikia.nocookie.net/disney/images/b/ba/Abis_Mal%27s_Thugs.jpg", url: "https://api.disneyapi.dev/characters/21")
    ]
    
    func testCorrectCharacter() {
        vc?.disneyCharacters = dummyCharacters
        vc?.sortCharacterByName("A")
        XCTAssertEqual(response1, vc?.filteredArray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
