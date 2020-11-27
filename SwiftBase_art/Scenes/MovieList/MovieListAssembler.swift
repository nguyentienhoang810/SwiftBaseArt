//
//  MovieListAssembler.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct MovieListAssembler: Assembler {
    typealias VC = MovieListVC
    typealias VM = MovieListVM
    typealias Navi = MovieListNavi

    func initVC(coordinator: MovieListNavi) -> MovieListVC {
        let vc = MovieListVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }

    func initVM(coordinator: MovieListNavi) -> MovieListVM {
        return MovieListVM(coordinator: coordinator)
    }
}
