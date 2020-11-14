//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol AppNaviType {
    func toHome()
}

struct AppNavi: AppNaviType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toHome() {
        let rootNC = UINavigationController()
        window.rootViewController = rootNC
        window.makeKeyAndVisible()

        let homeNav = assembler.initNavi(navigator: rootNC)
        homeNav.start()

    }
}

