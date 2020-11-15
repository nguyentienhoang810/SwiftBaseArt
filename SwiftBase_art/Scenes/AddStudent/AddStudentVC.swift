//
//  AddStudentVC.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class AddStudentVC: BaseVC {
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var classNameTextField: UITextField!
    @IBOutlet private var addButton: UIButton!
    @IBOutlet private var closeButton: UIButton!

    var vm: AddStudentVM!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        nameTextField.placeholder = "Student name"
        nameTextField.delegate = self
        nameTextField.backgroundColor = .white
        classNameTextField.placeholder = "Class name"
        classNameTextField.delegate = self
        classNameTextField.backgroundColor = .white
        addButton.setTitleColor(.white, for: .normal)
        closeButton.setTitle("", for: .normal)
        let closeImage = UIImage(systemName: "xmark")?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .bold))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        closeButton.setImage(closeImage, for: .normal)
    }
}

extension AddStudentVC: UITextFieldDelegate {
    // MARK: - UITextFieldDelegate

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField === classNameTextField {
            return false
        }
        return true
    }
}
