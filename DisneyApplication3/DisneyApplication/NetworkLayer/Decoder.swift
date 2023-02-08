//
//  Decoder.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation

// Generic decode method for Decodable
protocol Decoder {
    func decode<T: Decodable>(data: Data, type: T.Type) throws -> T
}
extension Decoder {
    func decode<T: Decodable>(data: Data, type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
