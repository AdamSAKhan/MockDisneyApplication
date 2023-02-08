//
//  FakeNetworkApiClient.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
@testable import DisneyApplication

struct FakeNetworkApiClient: NetworkApiContract {
    var data: Data?
    func get(request: Request) async throws -> Data {
        guard let data = data else {
            throw NetworkError.badRequest
        }
        return data
    }
}
