//
//  TabbarAssembler.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct TabbarAssembler: Assembler {
    typealias VC = TabbarVC
    typealias VM = TabbarVM
    typealias Navi = TabbarNavi

    func initVC(coordinator: TabbarNavi) -> TabbarVC {
        let vc = TabbarVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }

    func initVM(coordinator: TabbarNavi) -> TabbarVM {
        return TabbarVM(coordinator: coordinator)
    }
}
