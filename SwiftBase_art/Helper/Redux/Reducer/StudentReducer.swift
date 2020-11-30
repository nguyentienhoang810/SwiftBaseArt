//
//  StudentReducer.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct StudentReducer: Reducer {
    func handlerAction(state: ReduxState, action: Action) -> ReduxState {
        guard let state = state as? StudentState else {
            fatalError()
        }
        if let action = action as? StudentAction {
            switch action {
            case let .addClass(aClass):
                return StudentState(listClass: state.listClass + [aClass])
            case let .removeClass(aClass):
                return StudentState(listClass: state.listClass.remove(aClass: aClass))
            case let .addStudent(student, aClass):
                return StudentState(listClass: state.listClass.add(student: student, toClass: aClass))
            case let .removeStudent(student, aClass):
                return StudentState(listClass: state.listClass.remove(student: student, inClass: aClass))
            }
        }
        return StudentState()
    }
}
