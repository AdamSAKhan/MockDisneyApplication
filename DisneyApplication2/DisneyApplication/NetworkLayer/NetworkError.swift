//
//  NetworkError.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

enum NetworkError: Error, Equatable {
    case badRequest
    case invalidRequest
    case resourceNotFound404
    case serverError502
    case apiFailed(statusCode: Int)
    case parsingFailed
    case badResponse
}
