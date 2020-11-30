//
//  AuthenticationStore.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class AuthenticationStore: Store {
    typealias S = LoggedInState

    var reducer: Reducer
    @Published var state: LoggedInState
    var middleware: Middleware

    required init(reducer: Reducer, state: LoggedInState, middleware: Middleware) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }
}
