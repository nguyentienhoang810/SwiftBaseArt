//
//  Helper.swift
//  SwiftBase_art
//
//  Created by Apple on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation
import UIKit

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

protocol Reducer {
    func handlerAction(state: ReduxState, action: Action) -> ReduxState
}

protocol Middleware {
    func proccess(getState: @escaping GetState, dispatch: @escaping DispatchFunction) -> (@escaping DispatchFunction) -> DispatchFunction
}

protocol Store: ObservableObject {
    associatedtype S: ReduxState

    var reducer: Reducer { get }
    var state: S { get set }
    var middleware: Middleware { get set }

    init(reducer: Reducer, state: S, middleware: Middleware)

    func dispatch(action: Action) -> Any
    func getState() -> S?
}

extension Store {
    func dispatch(action: Action) -> Any {
        let getState: GetState = { [unowned self] in
            self.getState()
        }
        let dispatch: DispatchFunction = { [unowned self] in
            self.dispatch(action: $0)
        }
        let dispatchCore: DispatchFunction = { [unowned self] in
            self.dispatchCore(action: $0)
        }
        return middleware.proccess(getState: getState, dispatch: dispatch)(dispatchCore)(action)
    }

    func getState() -> S? {
        return state
    }

    fileprivate func dispatchCore(action: Action) {
        state = reducer.handlerAction(state: state, action: action) as! Self.S
    }
}

typealias GetState = () -> ReduxState?
typealias DispatchFunction = (Action) -> Any

struct StoreGroup {
    static let authenticationStore = AuthenticationStore(reducer: AuthenticationReducer(), state: AuthenticationReducer().initialAuthenticationState(), middleware: ThunkMiddleware())
    static let studentStore = StudentStore(reducer: StudentReducer(), state: StudentState(listClass: []), middleware: StudentMiddleware())
}

struct UserDefaultKey {
    static let loggedInKey = "loggedInKey"
}

class Helper {
    static let shared = Helper()

    var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultKey.loggedInKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKey.loggedInKey)
        }
    }
}
