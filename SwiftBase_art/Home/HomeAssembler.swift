//
//  HomeAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol HomeAssembler {
    func initVC() -> HomeVC
    func initVM() -> HomeVM
    func initNavi() -> HomeNaviType
}

extension HomeAssembler {
    func initVC() -> HomeVC {
        return HomeVC()
    }

    func initVM() -> HomeVM {
        return HomeVM(homeNavi: initNavi())
    }
    
    func initNavi() -> HomeNaviType {
        return HomeNavi()
    }
}
