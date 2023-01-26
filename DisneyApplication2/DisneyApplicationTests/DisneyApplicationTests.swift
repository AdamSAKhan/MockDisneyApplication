//
//  DisneyApplicationTests.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 24/01/2023.
//

import XCTest
@testable import DisneyApplication

final class NetworkManagerTests: XCTestCase {
    
    func testWhenApiResponseHasStatusCode404() async {
        
        let response =  HTTPURLResponse(url: URL(string:"test")!, statusCode:404, httpVersion:"https", headerFields:nil)!
        let mockNetworkSesson = MockNetworkSession(data: "test".data(using: .utf8), response: response)
        let networkManager = NetworkApiClient(urlSession: mockNetworkSesson)
        let request = DisneyRequest()
        do {
             _ = try await networkManager.get(request: request)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.resourceNotFound404)
        }
    }
    
    func testWhenApiResponseHasStatusCode502() async {
        
        let response =  HTTPURLResponse(url: URL(string:"test")!, statusCode:502, httpVersion:"https", headerFields:nil)!
        let mockNetworkSesson = MockNetworkSession(data: "test".data(using: .utf8), response: response)
        let networkManager = NetworkApiClient(urlSession: mockNetworkSesson)
        let request = DisneyRequest()
        do {
             _ = try await networkManager.get(request: request)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.serverError502)
        }
    }
    
    func testWhenApiResponseHasStatusCode200() async {
        
        let response =  HTTPURLResponse(url: URL(string:"test")!, statusCode:200, httpVersion:"https", headerFields:nil)!
        let actualData = "test".data(using: .utf8)
        let mockNetworkSesson = MockNetworkSession(data:actualData , response: response)
        let networkManager = NetworkApiClient(urlSession: mockNetworkSesson)
        let request = DisneyRequest()
        let expectedData = try! await networkManager.get(request: request)
       XCTAssertEqual(actualData, expectedData)
    }
    /**
     when api is successfull
     get function will return expected data , reading data from locally saved json.
     */
//    func test_get_pokemon_when_api_is_success() async {
//        // Reading local json file data
//        let bundle = Bundle(for: NetworkManagerTests.self)
//        guard let path =  bundle.url(forResource: "PokemonCardsMock", withExtension: "json") else { return }
//        let data = try? Data(contentsOf: path)
//        NetworkingMock.data = data
//
//        let networkManager = NetworkApiClient(urlSession: NetworkingMock())
//        let url = URL(string:"https://www.test.com")!
//        let actualData = try! await networkManager.get(url: url)
//        XCTAssertEqual(actualData, data)
//    }
//    /**
//     when api is not successfull it will return data not found error
//     */
//    func test_get_pokemon_when_api_fails() async {
//        let networkManager = NetworkApiClient(urlSession: NetworkingMock())
//        let url = URL(string:"https://www.test.com")!
//        do {
//            let _ = try await networkManager.get(url: url)
//        }catch {
//            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
//        }
//    }
}

