//
//  AddClassAssembler.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct AddClassAssembler: Assembler {
    typealias VC = AddClassVC
    typealias VM = AddClassVM
    typealias Navi = AddClassNavi
    
    func initVC(coordinator: AddClassNavi) -> AddClassVC {
        let vc = AddClassVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }
    
    func initVM(coordinator: AddClassNavi) -> AddClassVM {
        return AddClassVM(coordinator: coordinator)
    }
}
