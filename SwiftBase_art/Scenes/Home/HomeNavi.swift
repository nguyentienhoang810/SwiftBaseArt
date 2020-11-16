//
//  AppCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct HomeNavi: Coordinator {
    weak var navigator: UINavigationController?
    
    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }
    
    func start() {
        let vc = HomeAssembler().initVC(coordinator: self)
        vc.title = "List Class"
        navigator?.pushViewController(vc, animated: false)
    }
    
    func goToListStudent(aClass: Class) {
        let listNavi = ListNavi(navigator: navigator)
        listNavi.start(aClass: aClass)
    }
    
    func showAddClass() {
        let addClassNavi = AddClassNavi(navigator: navigator)
        addClassNavi.start()
    }
}
