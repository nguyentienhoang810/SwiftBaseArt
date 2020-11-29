//
//  MovieListVM.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation

class MovieListVM: ViewModel, MovieService {
    var apiSession: APIService

    typealias Navi = MovieListNavi

    var navi: MovieListNavi

    required init(coordinator: MovieListNavi) {
        navi = coordinator
        apiSession = APISession()
    }

    struct Input {
        let getListMoviePopular: AnyPublisher<MovieEndpoint.GetListMoviePopularParam, Never>
    }

    struct Output {
        let getListMoviePopularSuccess: AnyPublisher<MovieListModel, APIError>
    }

    func transform(input: Input) -> Output {
        let getListMoviePopularSuccess = input.getListMoviePopular
            .setFailureType(to: APIError.self)
            .flatMap { [weak self] param -> AnyPublisher<MovieListModel, APIError> in
                guard let self = self else { return Empty<MovieListModel, APIError>(completeImmediately: false).eraseToAnyPublisher() }
                return self.getListMoviePopular(param: param).eraseToAnyPublisher()
            }
            .retry(10)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        return Output(getListMoviePopularSuccess: getListMoviePopularSuccess)
    }
}
