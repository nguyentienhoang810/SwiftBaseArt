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
    unowned let assembler: Assembler
    unowned let navigator: UINavigationController
}

extension HomeNavi: HomeNaviType {
    func start() {
        let homeVC: HomeVC = assembler.initVC(navigator: navigator)
        navigator.pushViewController(homeVC, animated: true)
    }
    
    func gotoList() {
        let listNavi = assembler.initNav(nav: navigator)
        listNavi.start()
    }
}
