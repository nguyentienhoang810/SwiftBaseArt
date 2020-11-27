//
//  MovieEndpoint.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/24/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Alamofire
import Foundation

enum MovieEndpoint {
    static let movieAPIEndpoint = "https://api.themoviedb.org"
    static let API_KEY = "c6bcf9b396562b60515b1e6edfebda90"

    enum Version: String {
        case v3 = "3"

        var path: String {
            movieAPIEndpoint / rawValue
        }
    }

    case listMoviePopular(param: GetListMoviePopularParam)
}

extension MovieEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case let .listMoviePopular(param):
            let url = URL(string: MovieEndpoint.Version.v3.path / "movie/popular")!
            let request = createURLRequest(url: url, method: .get, urlParameters: getUrlParameters(param.dictionary), bodyParameters: [:])
            return request
        }
    }

    private func getUrlParameters(_ param: [String: Any]) -> Parameters {
        var result: Parameters = ["api_key": MovieEndpoint.API_KEY]
        for item in param {
            result[item.key] = item.value
        }
        return result
    }
}

extension MovieEndpoint {
    struct GetListMoviePopularParam: Encodable {
        var language = "en-US"
        var page = 1
        var region: String? = nil
    }
}
