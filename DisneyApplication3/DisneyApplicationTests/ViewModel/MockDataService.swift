//
//  MockDataService.swift
//  DisneyApplicationTests
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
@testable import DisneyApplication

struct MockDataService: Service {
    var disneyResponse: DisneyResponse?
    func get<T>(request: DisneyApplication.Request, type: T.Type) async throws -> T where T : Decodable {
        guard let disneyResponse = disneyResponse else {
            throw NetworkError.badResponse
        }
        return disneyResponse as! T
    }
}
