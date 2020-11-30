//
//  NetworkCore.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/24/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Alamofire
import Combine
import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }

    func createURLRequest(url: URL, method: HTTPMethod, urlParameters: Parameters, bodyParameters: Parameters, timeout: TimeInterval) -> URLRequest
}

extension RequestBuilder {
    func createURLRequest(url: URL, method: HTTPMethod, urlParameters: Parameters, bodyParameters: Parameters, timeout: TimeInterval = 20) -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: timeout)
        request.method = method
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            try request = URLEncoding().encode(request, with: urlParameters)
            if method != .get {
                try request = JSONEncoding().encode(request, with: bodyParameters)
            }
        } catch {
            print("Encoding parameter fail: \(error.localizedDescription)")
        }
        return request
    }
}

enum APIError: Error {
    case decodingError
    case httpError(Int, String)
    case unknown(String)

    var localizedDescription: String {
        switch self {
        case .decodingError:
            return "Error format JSON"
        case let .httpError(code, message):
            return "HTTP error code: \(code). " + message
        case let .unknown(message):
            return message
        }
    }
}

protocol APIService {
    func request<T: Codable>(with builder: RequestBuilder, decoder: JSONDecoder?) -> AnyPublisher<T, APIError>
}

struct APIResponseError: Codable {
    let code: Int?
    let message: String?
}

struct APIResponse<T: Codable>: Codable {
    let status: Bool?
    let data: T?
    let error: APIResponseError?
}
