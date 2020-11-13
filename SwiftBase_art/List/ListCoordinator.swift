//
//  ListCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol ListCoordinatorType {
    func start()
    func backToHome()
}

struct ListCoordinator {
    var navigator: UINavigationController!
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
}

extension ListCoordinator: ListCoordinatorType {
    func start() {
        let listVC = ListVC()
        navigator.pushViewController(listVC, animated: true)
    }
    
    func backToHome() {
        navigator.popViewController(animated: true)
    }
}
