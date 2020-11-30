//
//  StudentAction.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

enum StudentAction: Action {
    case addStudent(Student, Class)
    case removeStudent(Student, Class)
    case addClass(Class)
    case removeClass(Class)
}
