//
//  AuthenticationState.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import FirebaseAuth
import Foundation

enum LoggedInState: ReduxState {
    case beginLogin
    case loginFailed(error: Error)
    case notLoggedIn(verificationId: String?)
    case loggedIn(user: FirebaseAuth.User?)
}
