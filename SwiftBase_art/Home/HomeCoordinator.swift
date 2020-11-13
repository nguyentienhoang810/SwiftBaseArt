//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol HomeCoordinatorType {
    func start()
    func gotoList()
}

struct HomeCoordinator {
    var navigator: UINavigationController!
    var window: UIWindow!
    
    init(navigator: UINavigationController, window: UIWindow) {
        self.navigator = navigator
        self.window = window
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}

extension HomeCoordinator: HomeCoordinatorType {
    func start() {
        let rootVC = HomeVC()
        let vm = HomeVM(homeCoordinator: self)
        rootVC.vm = vm
        navigator.pushViewController(rootVC, animated: true)
    }
    
    func gotoList() {
        let listVC = ListVC()
        navigator.pushViewController(listVC, animated: true)
    }
}
