//
//  ListAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct ListAssembler: Assembler {
    typealias VC = ListVC
    typealias VM = ListVM
    typealias Navi = ListNavi
    
    func initVC(coordinator: ListNavi) -> ListVC {
        let vc = ListVC()
        vc.vm = initVM(coordinator: coordinator)
        return vc
    }
    
    func initVM(coordinator: ListNavi) -> ListVM {
        return ListVM(coordinator: coordinator)
    }
}
