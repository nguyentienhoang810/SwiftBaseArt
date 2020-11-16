//
//  HomeVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import Combine

class HomeVM: ViewModel {
    typealias Navi = HomeNavi
    
    var navi: HomeNavi
    
    required init(coordinator: HomeNavi) {
        self.navi = coordinator
    }
    
    func getListClass() -> AnyPublisher<[Class], Never> {
        return StoreGroup.studentStore.$state.map{ $0.listClass }.eraseToAnyPublisher()
    }
}

extension HomeVM {    
    //MARK: Handle navigator
    
    func goToListStudent(aClass: Class) {
        navi.goToListStudent(aClass: aClass)
    }
    
    func showAddClass() {
        navi.showAddClass()
    }
}
