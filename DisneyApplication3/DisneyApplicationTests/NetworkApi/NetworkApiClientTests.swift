//
//  NetworkApiClientTests.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import XCTest
@testable import DisneyApplication

final class NetworkApiClientTests: XCTestCase {
    
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
}

