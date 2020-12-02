//
//  AppVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

class AppVM: ViewModel {
    typealias VC = UIViewController
    typealias Navi = AppNavi

    var navi: AppNavi
    var vc: UIViewController?

    required init(coordinator: AppNavi) {
        navi = coordinator
    }
}

extension AppVM {
    // MARK: - Handle navigator

    func goToHomeTabbar() {
        navi.goToHomeTabbar()
    }

    func goToLogin() {
        navi.goToLogin()
    }
}
