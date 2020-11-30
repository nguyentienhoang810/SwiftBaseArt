//
//  AppVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class AppVM: ViewModel {
    typealias Navi = AppNavi

    var navi: AppNavi

    required init(coordinator: AppNavi) {
        navi = coordinator
    }
}

extension AppVM {
    // MARK: - Handle navigator

    func goToMovieList() {
        navi.goToMovieList()
    }

    func goToLogin() {
        navi.goToLogin()
    }
}
