//
//  LoginAssembler.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct LoginAssembler: Assembler {
    typealias VC = LoginVC
    typealias VM = LoginVM
    typealias Navi = LoginNavi

    func initVC(coordinator: LoginNavi) -> LoginVC {
        let vc = LoginVC()
        vc.vm = LoginVM(coordinator: coordinator)
        return vc
    }

    func initVM(coordinator: LoginNavi) -> LoginVM {
        return LoginVM(coordinator: coordinator)
    }
}
