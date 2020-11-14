//
//  HomeAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol HomeAssembler {
    func initVC(navigator: UINavigationController) -> HomeVC
    func initVM(navigator: UINavigationController) -> HomeVM
    func initNavi(navigator: UINavigationController) -> HomeNaviType
}

extension HomeAssembler {
    func initVC(navigator: UINavigationController) -> HomeVC {
        let vm = initVM(navigator: navigator)
        let vc = HomeVC()
        vc.vm = vm
        return vc
    }

    func initVM(navigator: UINavigationController) -> HomeVM {
        return HomeVM(homeNavi: initNavi(navigator: navigator))
    }
}

extension HomeAssembler where Self: Assembler {
    func initNavi(navigator: UINavigationController) -> HomeNaviType {
        return HomeNavi(assembler: self, navigator: navigator)
    }
}
