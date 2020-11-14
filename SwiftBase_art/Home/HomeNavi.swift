//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol HomeNaviType {
    func start()
    func gotoList()
}

struct HomeNavi {
    var navigator: UINavigationController!
    var window: UIWindow!
}

extension HomeNavi: HomeNaviType {
    func start() {
//        let rootVC = HomeVC()
//        let vm = HomeVM(homeCoordinator: self)
//        rootVC.vm = vm
//        navigator.pushViewController(rootVC, animated: true)
//
//        window.rootViewController = navigator
//        window.makeKeyAndVisible()
    }
    
    func gotoList() {
        let listVC = ListVC()
        navigator.pushViewController(listVC, animated: true)
    }
}
