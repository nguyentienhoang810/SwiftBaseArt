//
//  AppAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol AppAssembler {
    func initVM(window: UIWindow) -> AppVM
    func initNavi(window: UIWindow) -> AppNaviType
}

extension AppAssembler {
    func initVM(window: UIWindow) -> AppVM {
        return AppVM(nav: initNavi(window: window))
    }
}

extension AppAssembler where Self: Assembler {
    func initNavi(window: UIWindow) -> AppNaviType {
        return AppNavi(assembler: self, window: window)
    }
}
