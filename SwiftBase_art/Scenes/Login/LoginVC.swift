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

    // MARK: - IBAction

    @IBAction private func loginButtonTapped(_ sender: UIButton) {}
}

extension LoginVC: UITextFieldDelegate {
    // MARK: - UITextFieldDelegate
}
