//
//  NetworkAPIcontract.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

protocol NetworkApiContract {
    func get(request: Request) async throws -> Data
}
