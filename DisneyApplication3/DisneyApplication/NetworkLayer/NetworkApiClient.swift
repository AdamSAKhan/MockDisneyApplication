//
//  NetworkApiClient.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

struct NetworkApiClient {
    private let urlSession: NetworkSessionContract
    init(urlSession: NetworkSessionContract = URLSession.shared) {
        self.urlSession = urlSession
    }
}
extension NetworkApiClient: NetworkApiContract {
    func get(request: Request) async throws -> Data {
        do {
            let urlRequest = try request.getUrlRequest()
            let (data, response) = try await  urlSession.data(for: urlRequest)
            let isValidResponse = try response.isValidResponse()
            if isValidResponse {
                return data
            } else {
                throw NetworkError.badResponse
            }
        } catch {
            throw error
        }
    }
}
