//
//  AddClassVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class AddClassVM: ViewModel {
    typealias Navi = AddClassNavi
    
    var navi: AddClassNavi
    
    required init(coordinator: AddClassNavi) {
        self.navi = coordinator
    }
}

extension AddClassVM {
    // MARK: - Handle navigator
    
    func backToHome() {
        navi.backToHome()
    }
}
