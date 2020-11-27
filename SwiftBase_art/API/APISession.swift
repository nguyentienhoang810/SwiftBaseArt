//
//  APISession.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/24/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation

let apiMessageError = "Could not process normally.\nPlease try again later."

struct APISession: APIService {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    func request<T>(with builder: RequestBuilder, decoder: JSONDecoder? = nil) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = decoder ?? self.decoder
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown(apiMessageError) }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200 ... 299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError { _ in .decodingError }
                            .eraseToAnyPublisher()
                    } else if let statusCode = HTTPStatusCode(rawValue: response.statusCode) {
                        return Fail(error: APIError.httpError(statusCode.rawValue, statusCode.description)).eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown(apiMessageError)).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

struct MyAPISession: APIService {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    func request<T>(with builder: RequestBuilder, decoder: JSONDecoder? = nil) -> AnyPublisher<T, APIError> where T: Codable {
        let decoder = decoder ?? self.decoder
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown(apiMessageError) }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200 ... 299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: APIResponse<T>.self, decoder: decoder)
                            .mapError { _ in .decodingError }
                            .flatMap({ response -> AnyPublisher<T, APIError> in
                                if response.status == true, let data = response.data {
                                    return CurrentValueSubject<T, APIError>(data).eraseToAnyPublisher()
                                } else if let error = response.error {
                                    return Fail(error: APIError.httpError(error.code ?? 0, error.message ?? "")).eraseToAnyPublisher()
                                } else {
                                    return Fail(error: APIError.unknown(apiMessageError)).eraseToAnyPublisher()
                                }
                            })
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error: APIError.httpError(response.statusCode, apiMessageError)).eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown(apiMessageError)).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
