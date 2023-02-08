//
//  MockNetworkSession.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
@testable import DisneyApplication

struct MockNetworkSession: NetworkSessionContract {
    var data: Data?
    var response: URLResponse
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = data else {
            throw NetworkError.invalidRequest
        }
        return (data, response)
    }
}
