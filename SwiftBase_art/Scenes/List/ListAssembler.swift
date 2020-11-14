//
//  ListAssembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

protocol ListAssembler {
    func initVC(nav: UINavigationController) -> ListVC
    func initVM(nav: UINavigationController) -> ListVM
    func initNav(nav: UINavigationController) -> ListNaviType
}

extension ListAssembler {
    func initVC(nav: UINavigationController) -> ListVC {
        let vc = ListVC()
        let vm = initVM(nav: nav)
        vc.vm = vm
        return vc
    }
    
    func initVM(nav: UINavigationController) -> ListVM {
        return ListVM(listNavi: initNav(nav: nav))
    }
}

extension ListAssembler where Self: Assembler {
    func initNav(nav: UINavigationController) -> ListNaviType {
        return ListNavi(nav: nav)
    }
}
