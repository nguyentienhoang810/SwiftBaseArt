//
//  AddStudentAssembler.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct AddStudentAssembler: Assembler {
    typealias VC = AddStudentVC
    typealias VM = AddStudentVM
    typealias Navi = AddStudentNavi
    
    func initVC(coordinator: AddStudentNavi) -> AddStudentVC {
        let vc = AddStudentVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }
    
    func initVM(coordinator: AddStudentNavi) -> AddStudentVM {
        return AddStudentVM(coordinator: coordinator)
    }
}
