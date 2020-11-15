//
//  Helper.swift
//  SwiftBase_art
//
//  Created by Apple on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit
import Combine

protocol Coordinator {
    var navigator: UINavigationController? { get set }

    init(navigator: UINavigationController?)

    func start()
}

protocol ViewModel: ObservableObject {
    associatedtype Navi: Coordinator

    var navi: Navi { get set }

    init(coordinator: Navi)

    func start()
}

extension ViewModel {
    func start() {
        navi.start()
    }
}

protocol Action {}

protocol ReduxState {}

typealias Reducer<S: ReduxState> = (S, Action) -> S

protocol Store: ObservableObject {
    associatedtype S: ReduxState

    var reducer: Reducer<S> { get }
    var state: S { get set }

    init(reducer: @escaping Reducer<S>, state: S)

    func dispatch(action: Action)
    func getState() -> S
}

// Student State

enum StudentAction: Action {
    case addStudent(Student, Class)
    case removeStudent(Student, Class)
    case addClass(Class)
    case removeClass(Class)
}

struct StudentState: ReduxState {
    var listClass: [Class] = []
}

let StudentReducer: Reducer<StudentState> = { state, action in
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

class StudentStore: Store {
    typealias S = StudentState

    var reducer: Reducer<StudentState>
    @Published var state: StudentState

    required init(reducer: @escaping Reducer<StudentState>, state: StudentState) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        state = reducer(state, action)
    }

    func getState() -> StudentState {
        return state
    }
}

struct StoreGroup {
    static let studentStore = StudentStore(reducer: StudentReducer, state: StudentState(listClass: []))
}
