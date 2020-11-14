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
    unowned let window: UIWindow
    
    func toHome() {
        print("direct to home from AppNavi")
        let rootNC = UINavigationController()

        window.rootViewController = rootNC
        
        rootNC.pushViewController(HomeVC(), animated: true)
        window.makeKeyAndVisible()

//        let homeCoordinator = HomeCoordinator(assembler: assembler,
//                                            navigationController: rootNC,
//                                            window: window)
//        homeCoordinator.start()
        
    }
}

