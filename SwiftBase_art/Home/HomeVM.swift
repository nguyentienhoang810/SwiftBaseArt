//
//  HomeVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct HomeVM {
    let homeCoordinator: HomeCoordinatorType
}

extension HomeVM {
    
    //MARK: handle navigator
    func gotoList() {
        homeCoordinator.gotoList()
    }
}
