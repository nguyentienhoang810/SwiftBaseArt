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
    typealias VC = MovieListVC
    typealias Navi = MovieListNavi

    var navi: MovieListNavi
    var apiSession: APIService
    weak var vc: MovieListVC?

    private var cancellables = Set<AnyCancellable>()

    required init(coordinator: MovieListNavi) {
        navi = coordinator
        apiSession = APISession()
    }
}

extension MovieListVM {
    // MARK: - handle call API

    func fetchListMoviePopular(param: MovieEndpoint.GetListMoviePopularParam) {
        getListMoviePopular(param: param)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .failure(error):
                    self.vc?.handleGetListMoviePopularSuccess(result: APIResult<MovieListModel>.failure(error))
                default:
                    break
                }
            } receiveValue: { [weak self] movieList in
                guard let self = self else { return }
                self.vc?.handleGetListMoviePopularSuccess(result: APIResult<MovieListModel>.success(movieList))
            }
            .store(in: &cancellables)
    }
}
