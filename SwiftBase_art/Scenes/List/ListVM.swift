//
//  ListVM.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import Combine

class ListVM: ViewModel {
    typealias Navi = ListNavi
    
    var navi: ListNavi
    
    required init(coordinator: ListNavi) {
        self.navi = coordinator
    }
}

extension ListVM {
    // MARK: - Handle navigator
    
    func showAddStudent() {
        navi.showAddStudent()
    }
    
    func getListStudent(from aClass: Class) -> AnyPublisher<[Student], Never> {
        return StoreGroup.studentStore.$state.map { $0.listClass.getListStudent(from: aClass) }.eraseToAnyPublisher()
    }
}
