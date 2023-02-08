//
//  Service.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

protocol Service: Decoder {
    func get<T: Decodable>(request: Request, type: T.Type )async throws -> T
}
