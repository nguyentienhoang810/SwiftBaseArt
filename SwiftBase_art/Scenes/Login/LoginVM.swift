//
//  LoginVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import UIKit

class LoginVM: ViewModel {
    typealias VC = LoginVC
    typealias Navi = LoginNavi

    var navi: LoginNavi
    weak var vc: LoginVC?

    private var cancellables = Set<AnyCancellable>()

    required init(coordinator: LoginNavi) {
        navi = coordinator
    }
}

extension LoginVM {
    // MARK: - handle login

    func observerLoginState() {
        StoreGroup.authenticationStore.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self else { return }
                self.vc?.handleLoginState(state)
            }
            .store(in: &cancellables)
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

    // MARK: - handle navigator

    func showVerifySmsCodeForm() {
        let alertVC = UIAlertController(title: "SMS Code", message: "Enter sms code", preferredStyle: .alert)
        var codeTextField: UITextField?
        alertVC.addTextField { textField in
            textField.placeholder = "SMS code"
            codeTextField = textField
        }
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let self = self else { return }
            if let code = codeTextField?.text, !code.isEmpty {
                self.login(smsCode: code)
            }
        }
        alertVC.addAction(action)
        vc?.present(alertVC, animated: true, completion: nil)
    }
}
