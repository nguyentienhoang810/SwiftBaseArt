//
//  ListCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol ListNaviType {
    func start()
    func backToHome()
}

struct ListNavi {
    unowned let nav: UINavigationController
}

extension ListNavi: ListNaviType {
    func start() {
        let listVC = ListVC()
        nav.pushViewController(listVC, animated: true)
    }
    
    func backToHome() {
        nav.popViewController(animated: true)
    }
}
