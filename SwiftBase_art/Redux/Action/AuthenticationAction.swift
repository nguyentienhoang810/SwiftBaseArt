//
//  AuthenticationAction.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import FirebaseAuth
import Foundation

enum AuthenticationError: Error {
    case verifiPhoneNumberError
    case verifiSmsCodeError

    var localizedDescription: String {
        switch self {
        case .verifiPhoneNumberError: return "Xác thực số điện thoại không thành công"
        case .verifiSmsCodeError: return "Xác thực mã OTP không thành công"
        }
    }
}

struct AuthenticationActionCreator {
    func login(phoneNumber: String) -> (@escaping GetState, @escaping DispatchFunction) -> Void {
        return { _, dispatch in
            _ = dispatch(AuthenticationAction.beginLogin)
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    _ = dispatch(AuthenticationAction.loginFailed(error: error))
                    return
                }
                if let verificationId = verificationID {
                    _ = dispatch(AuthenticationAction.verifiedPhone(verificationId: verificationId))
                } else {
                    _ = dispatch(AuthenticationAction.loginFailed(error: AuthenticationError.verifiPhoneNumberError))
                }
            }
        }
    }

    func login(smsCode: String) -> (@escaping GetState, @escaping DispatchFunction) -> Void {
        return { getState, dispatch in
            guard let state = getState() as? LoggedInState else {
                return
            }
            switch state {
            case let .notLoggedIn(verificationId):
                if let verificationId = verificationId {
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)
                    _ = dispatch(AuthenticationAction.beginLogin)
                    Auth.auth().signIn(with: credential) { authResult, error in
                        if let error = error {
                            _ = dispatch(AuthenticationAction.loginFailed(error: error))
                            return
                        }
                        if let user = authResult?.user {
                            _ = dispatch(AuthenticationAction.verifiedSmsCode(user: user))
                        } else {
                            _ = dispatch(AuthenticationAction.loginFailed(error: AuthenticationError.verifiSmsCodeError))
                        }
                    }
                }
            default:
                break
            }
        }
    }
}

enum AuthenticationAction: Action {
    case beginLogin
    case loginFailed(error: Error)
    case verifiedPhone(verificationId: String)
    case verifiedSmsCode(user: FirebaseAuth.User)
    case logout
}
