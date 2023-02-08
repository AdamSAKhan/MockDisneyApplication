//
//  URLResponse+Extension.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

extension URLResponse {
    func isValidResponse()throws -> Bool {
        guard let response = self as? HTTPURLResponse else  {
            throw NetworkError.badResponse
        }
        switch response.statusCode {
        case 200..<299 :
            return true
        case 404 :
            throw NetworkError.resourceNotFound404
        case 502 :
            throw NetworkError.serverError502
        default :
            throw NetworkError.apiFailed(statusCode: response.statusCode)
        }
    }
}
