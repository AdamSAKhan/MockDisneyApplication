//
//  CharacterDetailsTests.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 25/01/2023.
//

import XCTest
import SwiftUI
@testable import DisneyApplication

final class CharacterDetailsTests: XCTestCase {

    /// For unpopulated appearences
    private var view1: CharacterDetails?
    /// For populated appearences
    private var view2: CharacterDetails?
    
    override func setUpWithError() throws {
        view1 = CharacterDetails(DisneyCharacter(films: [], shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], id: 4, name: "SomeGuy", imageURL: "", url: ""))
        view2 = CharacterDetails(DisneyCharacter(films: ["Troy"], shortFilms: ["Infinity War"], tvShows: ["Friends"], videoGames: ["Grand Theft Auto"], parkAttractions: ["The Cafeteria"], id: 4, name: "SomeGuy", imageURL: "", url: ""))
    }

    override func tearDownWithError() throws {
        view1 = nil
        view2 = nil
    }

    func testNoAppearences(){
        let correctString: String = "No Known Appearences"
        XCTAssertEqual(correctString, view1?.detail)
        
    }
    
    func testSomeAppearences() {
        let correctString: String = "Appeared in Friends, Grand Theft Auto, Infinity War, Troy"
        XCTAssertEqual(correctString, view2?.detail)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
