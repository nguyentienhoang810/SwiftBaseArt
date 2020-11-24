//
//  AuthenticationReducer.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import FirebaseAuth
import Foundation

struct AuthenticationReducer: Reducer {
    func handlerAction(state: ReduxState, action: Action) -> ReduxState {
        guard let _ = state as? LoggedInState else {
            fatalError()
        }
        if let action = action as? AuthenticationAction {
            switch action {
            case .beginLogin:
                return LoggedInState.beginLogin
            case let .loginFailed(error: error):
                return LoggedInState.loginFailed(error: error)
            case let .verifiedPhone(verificationId):
                return LoggedInState.notLoggedIn(verificationId: verificationId)
            case let .verifiedSmsCode(user):
                return LoggedInState.loggedIn(user: user)
            }
        }
        return LoggedInState.notLoggedIn(verificationId: nil)
    }

    func initialAuthenticationState() -> LoggedInState {
        if Helper.shared.isLoggedIn {
            return .loggedIn(user: Auth.auth().currentUser)
        } else {
            return .notLoggedIn(verificationId: nil)
        }
    }
}
