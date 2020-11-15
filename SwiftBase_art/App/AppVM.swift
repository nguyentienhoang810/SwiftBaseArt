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
        self.navi = coordinator
    }
}

extension AppVM {
    // MARK: - Handle navigator
    
    func goToHome() {
        navi.goToHome()
    }
    
    func goToLogin() {
        navi.goToLogin()
    }
}
