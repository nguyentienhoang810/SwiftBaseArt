//
//  HomeVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class HomeVM: ViewModel {
    typealias Navi = HomeNavi
    
    var navi: HomeNavi
    
    required init(coordinator: HomeNavi) {
        self.navi = coordinator
    }
}

extension HomeVM {    
    //MARK: Handle navigator
    
    func goToList() {
        navi.goToList()
    }
}
