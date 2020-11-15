//
//  Class.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct Class: Identifiable {
    var id = UUID().uuidString
    var name: String
    var students: [Student]
}

extension Array where Element == Class {
    func remove(aClass: Class) -> [Class] {
        if let index = self.firstIndex(where: { $0.id == aClass.id }) {
            var array = self
            array.remove(at: index)
            return array
        }
        return self
    }
    
    func add(student: Student, toClass aClass: Class) -> [Class] {
        if let index = self.firstIndex(where: { $0.id == aClass.id }) {
            var array = self
            array[index].students.append(student)
            return array
        }
        return self
    }
    
    func remove(student: Student, inClass aClass: Class) -> [Class] {
        if let index = self.firstIndex(where: { $0.id == aClass.id }) {
            var array = self
            var students = array[index].students
            students.removeAll(where: { $0.id == student.id })
            array[index].students = students
            return array
        }
        return self
    }
}
