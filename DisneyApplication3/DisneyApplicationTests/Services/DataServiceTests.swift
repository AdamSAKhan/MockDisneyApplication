//
//  DataServiceTests.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import XCTest
@testable import DisneyApplication

final class DataServiceTests: XCTestCase {
 
    var dataService: DataService!
    
    override func tearDown() {
        dataService = nil
    }
    
    func testWhenDataServieFetchedDataButParsigFails() async {
        // GIVEN : is fake network api client with some wrong data
        let networkApiClient = FakeNetworkApiClient(data: "test".data(using: .utf8))
        dataService = DataService(networkApiClient: networkApiClient)
    
        // WHEN : when get disney request to get characters
        let request = DisneyRequest()

        do {
            let _ = try await dataService.get(request:request , type: DisneyResponse.self)

        }catch {
            XCTAssertEqual(error as! JsonParserError, JsonParserError.parsingFailed)
        }
    }
    
    func testWhenNetowkServiceThrowsNetworkError() async {
        // GIVEN : is fake network api client with some wrong data
        let networkApiClient = FakeNetworkApiClient()
        dataService = DataService(networkApiClient: networkApiClient)
    
        // WHEN : when get disney request to get characters
        let request = DisneyRequest()

        do {
            let _ = try await dataService.get(request:request , type: DisneyResponse.self)

        }catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.badRequest)
        }
    }
    
    func testWhenNetowkServiceSendsDataAndParsingIsSuccessfull() async {
        // GIVEN : is fake network api client with some wrong data
        let bundle = Bundle(for: DataServiceTests.self)
        guard let path =  bundle.url(forResource:"DisneyResponse", withExtension: "json") else {
            return
        }
        let acutalData = try? Data(contentsOf: path)
        let networkApiClient = FakeNetworkApiClient(data: acutalData)
        dataService = DataService(networkApiClient: networkApiClient)
    
        // WHEN : when get disney request to get characters
        let request = DisneyRequest()

            let disneyResponse = try? await dataService.get(request:request , type: DisneyResponse.self)
            
            XCTAssertNotNil(disneyResponse)
            XCTAssertNotNil(disneyResponse?.data)

            XCTAssertEqual(disneyResponse?.data.count, 50)
    }
}

