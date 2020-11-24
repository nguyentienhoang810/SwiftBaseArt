//
//  LoginVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation

class LoginVM: ViewModel {
    typealias Navi = LoginNavi

    var navi: LoginNavi

    required init(coordinator: LoginNavi) {
        navi = coordinator
    }

    func getLoginState() -> AnyPublisher<LoggedInState, Never> {
        return StoreGroup.authenticationStore.$state.eraseToAnyPublisher()
    }

    func login(phoneNumber: String) {
        StoreGroup.authenticationStore.dispatch { (getState, dispatch) -> Any in
            AuthenticationActionCreator().login(phoneNumber: phoneNumber)(getState, dispatch)
        }
    }

    func login(smsCode: String) {
        StoreGroup.authenticationStore.dispatch { (getState, dispatch) -> Any in
            AuthenticationActionCreator().login(smsCode: smsCode)(getState, dispatch)
        }
    }
}
