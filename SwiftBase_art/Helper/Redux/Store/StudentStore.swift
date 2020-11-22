//
//  StudentStore.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

class StudentStore: Store {
    typealias S = StudentState

    var reducer: Reducer
    var middleware: Middleware
    @Published var state: StudentState

    required init(reducer: Reducer, state: StudentState, middleware: Middleware) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }
}
