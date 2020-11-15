//
//  AddStudentVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class AddStudentVM: ViewModel {
    typealias Navi = AddStudentNavi
    
    var navi: AddStudentNavi
    
    required init(coordinator: AddStudentNavi) {
        self.navi = coordinator
    }
}
