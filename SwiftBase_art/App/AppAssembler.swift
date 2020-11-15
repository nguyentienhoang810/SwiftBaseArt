//
//  AppAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct AppAssembler: Assembler {
    typealias VC = UINavigationController
    typealias VM = AppVM
    typealias Navi = AppNavi
    
    func initVM(window: UIWindow) -> AppVM {
        let vc = UINavigationController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        let navi = AppNavi(navigator: vc)
        return initVM(coordinator: navi)
    }
    
    func initVC(coordinator: AppNavi) -> UINavigationController {
        fatalError("Can't init AppVC")
    }
    
    func initVM(coordinator: AppNavi) -> AppVM {
        return AppVM(coordinator: coordinator)
    }
}
