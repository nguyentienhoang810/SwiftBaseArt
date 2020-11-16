//
//  AddStudentVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import Combine

class AddStudentVM: ViewModel {
    typealias Navi = AddStudentNavi
    
    var navi: AddStudentNavi
    
    required init(coordinator: AddStudentNavi) {
        self.navi = coordinator
    }
    
    func getListClass() -> AnyPublisher<[Class], Never> {
        return StoreGroup.studentStore.$state.map{ $0.listClass }.eraseToAnyPublisher()
    }
    
    func addStudent(_ student: Student, toClass aClass: Class) {
        return StoreGroup.studentStore.dispatch(action: StudentAction.addStudent(student, aClass))
    }
}

extension AddStudentVM {
    // MARK: - Handle navigator
    
    func backToListStudent() {
        navi.backToListStudent()
    }
}