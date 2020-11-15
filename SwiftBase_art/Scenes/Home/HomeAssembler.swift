//
//  HomeAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct HomeAssembler: Assembler {
    typealias VC = HomeVC
    typealias VM = HomeVM
    typealias Navi = HomeNavi
    
    func initVC(coordinator: HomeNavi) -> HomeVC {
        let vc = HomeVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }
    
    func initVM(coordinator: HomeNavi) -> HomeVM {
        return HomeVM(coordinator: coordinator)
    }
}
