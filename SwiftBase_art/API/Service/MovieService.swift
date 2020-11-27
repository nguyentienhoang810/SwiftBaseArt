//
//  MovieService.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/25/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation

protocol MovieService {
    var apiSession: APIService { get }

    func getListMoviePopular(param: MovieEndpoint.GetListMoviePopularParam) -> AnyPublisher<MovieListModel, APIError>
}

extension MovieService {
    func getListMoviePopular(param: MovieEndpoint.GetListMoviePopularParam) -> AnyPublisher<MovieListModel, APIError> {
        let requestBuilder = MovieEndpoint.listMoviePopular(param: param)
        return apiSession.request(with: requestBuilder, decoder: nil)
    }
}
