//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct AppNavi: Coordinator {
    weak var navigator: UINavigationController?

    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }

    func start() {
        if Helper.shared.isLoggedIn {
            goToHome()
        } else {
            goToLogin()
        }
    }

    func goToHome() {
        let homeNavi = HomeNavi(navigator: navigator)
        homeNavi.start()
    }

    func goToLogin() {
        let loginNavi = LoginNavi(navigator: navigator)
        loginNavi.start()
    }
}
