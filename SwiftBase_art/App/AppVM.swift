//
//  AppVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct AppVM {
    let nav: AppNaviType
}

extension AppVM {
    func directToHome() {
        nav.toHome()
    }
}
