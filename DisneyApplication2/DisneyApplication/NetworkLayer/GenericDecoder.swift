//
//  GenericDecoder.swift
//  DisneyApplication
//
//  Created by Adam Khan on 25/01/2023.
//

import Foundation




// Generic decode method for Decodable
func decode<T: Decodable>(data: Data) throws -> T {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
}
