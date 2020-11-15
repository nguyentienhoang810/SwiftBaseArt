//
//  AddClassVC.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class AddClassVC: BaseVC {
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var addButton: UIButton!
    @IBOutlet private var closeButton: UIButton!
    
    var vm: AddClassVM!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MẢRK: - Private methods
    
    private func setupUI() {
        nameTextField.backgroundColor = .white
        nameTextField.placeholder = "Class name"
        addButton.setTitleColor(.white, for: .normal)
        closeButton.setTitle("", for: .normal)
        let closeImage = UIImage(systemName: "xmark")?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .bold))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        closeButton.setImage(closeImage, for: .normal)
    }
    
    @IBAction private func addButtonTapped(sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        let aClass = Class(name: name, students: [])
        StoreGroup.studentStore.dispatch(action: StudentAction.addClass(aClass))
        vm.backToHome()
    }
}
