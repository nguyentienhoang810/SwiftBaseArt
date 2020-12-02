//
//  ProfileAssembler.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct ProfileAssembler: Assembler {
    typealias VC = ProfileVC
    typealias VM = ProfileVM
    typealias Navi = ProfileNavi

    func initVC(coordinator: ProfileNavi) -> ProfileVC {
        let vc = ProfileVC()
        let vm = initVM(coordinator: coordinator)
        vc.vm = vm
        vm.vc = vc
        return vc
    }

    func initVM(coordinator: ProfileNavi) -> ProfileVM {
        return ProfileVM(coordinator: coordinator)
    }
}
