//
//  LoginVC.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    @IBOutlet private var phoneTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!

    var vm: LoginVM!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        vm.observerLoginState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - Private methods

    private func setupUI() {
        phoneTextField.delegate = self
        phoneTextField.placeholder = "Phone number"
        phoneTextField.backgroundColor = .white
        loginButton.setTitleColor(.white, for: .normal)
    }

    // MARK: - Public methods

    func handleLoginState(_ state: LoggedInState) {
        switch state {
        case .beginLogin:
            startLoading()
        case let .loginFailed(error):
            stopLoading()
            Alert.present(message: error.localizedDescription, actions: .ok(handler: nil), from: self)
        case let .notLoggedIn(verificationId):
            stopLoading()
            if verificationId != nil {
                vm.showVerifySmsCodeForm()
            }
        case .loggedIn:
            stopLoading()
            Helper.shared.isLoggedIn = true
            ScreenTransitionManager.switchScreenFollowLoginState()
        default:
            break
        }
    }

    // MARK: - IBAction

    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        guard let phoneNumber = phoneTextField.text, !phoneNumber.isEmpty else {
            return
        }
        vm.login(phoneNumber: phoneNumber)
    }
}

extension LoginVC: UITextFieldDelegate {
    // MARK: - UITextFieldDelegate
}
