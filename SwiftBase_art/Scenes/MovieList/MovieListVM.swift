//
//  MovieListVM.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class MovieListVM: ViewModel {
    typealias Navi = MovieListNavi

    var navi: MovieListNavi

    required init(coordinator: MovieListNavi) {
        navi = coordinator
    }
}
