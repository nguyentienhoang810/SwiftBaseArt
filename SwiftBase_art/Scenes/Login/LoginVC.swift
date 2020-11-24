//
//  LoginVC.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import UIKit

class LoginVC: BaseVC {
    @IBOutlet private var phoneTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!

    var vm: LoginVM!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
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

    private func setupData() {
        vm.getLoginState().sink { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .beginLogin:
                self.startLoading()
            case let .loginFailed(error):
                self.stopLoading()
                Alert.present(message: error.localizedDescription, actions: .ok(handler: nil), from: self)
            case let .notLoggedIn(verificationId):
                self.stopLoading()
                if verificationId != nil {
                    self.showVerifiSmsCodeForm()
                }
            case .loggedIn:
                self.stopLoading()
                Helper.shared.isLoggedIn = true
                ScreenTransitionManager.transitToHome()
            }
        }
        .store(in: &cancellables)
    }

    private func showVerifiSmsCodeForm() {
        let alertVC = UIAlertController(title: "SMS Code", message: "Enter sms code", preferredStyle: .alert)
        var codeTextField: UITextField?
        alertVC.addTextField { textField in
            textField.placeholder = "SMS code"
            codeTextField = textField
        }
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let self = self else { return }
            if let code = codeTextField?.text, !code.isEmpty {
                self.vm.login(smsCode: code)
            }
        }
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
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
