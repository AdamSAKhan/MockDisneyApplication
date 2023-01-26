//
//  NetorkAPIRequests.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import Foundation

protocol Request {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [String: String] {get}
}
extension Request {
    var scheme: String {
        return "https"
    }
    var host: String {
        return Endpoint.baseUrl
    }
    var parameters: [String: String] {
        return [:]
    }
}
extension Request {
    func getUrlRequest()throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        let queryItems = parameters.map {
            URLQueryItem(name:$0, value: $1)
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw NetworkError.invalidRequest
        }
        return URLRequest(url: url)
    }
}
