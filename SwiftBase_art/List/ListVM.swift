//
//  ListVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct ListVM {
    let listNavi: ListNaviType
}

extension ListVM {
    func goback() {
        listNavi.backToHome()
    }
}
