//
//  DataService.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

struct DataService {
    private let networkApiClient: NetworkApiContract
    init(networkApiClient: NetworkApiContract) {
        self.networkApiClient = networkApiClient
    }
}
extension DataService: Service {
    func get<T>(request: Request, type: T.Type) async throws -> T where T : Decodable {
        do {
            let data =  try await networkApiClient.get(request: request)
            return try decode(data: data, type: type)
        }catch let error where error is NetworkError {
           throw error
        }catch {
            throw JsonParserError.parsingFailed
        }
    }
}
