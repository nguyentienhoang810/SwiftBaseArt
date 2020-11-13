//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol AppCoordinatorType {
    func start()
}

struct AppCoordinator {
    var navigator: UINavigationController!
    var window: UIWindow!
    
    init(navigator: UINavigationController, window: UIWindow) {
        self.navigator = navigator
        self.window = window
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: AppCoordinatorType {
    func start() {
        let rootVC = HomeVC()
        navigator.pushViewController(rootVC, animated: true)
    }
}
