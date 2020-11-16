//
//  AddStudentVC.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import Combine

class AddStudentVC: BaseVC {
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var classNameTextField: UITextField!
    @IBOutlet private var addButton: UIButton!
    @IBOutlet private var closeButton: UIButton!

    var vm: AddStudentVM!
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    private var listClass: [Class] = []
    private var cancellables = Set<AnyCancellable>()
    private var selectedClass: Class?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    // MARK: - Private methods

    private func setupUI() {
        nameTextField.placeholder = "Student name"
        nameTextField.delegate = self
        nameTextField.backgroundColor = .white
        classNameTextField.placeholder = "Class name"
        classNameTextField.delegate = self
        classNameTextField.backgroundColor = .white
        classNameTextField.inputView = pickerView
        addButton.setTitleColor(.blue, for: .normal)
        addButton.backgroundColor = .white
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner]
        addButton.layer.cornerRadius = 8
        addButton.layer.masksToBounds = true
        addButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        closeButton.setTitle("", for: .normal)
        let closeImage = UIImage(systemName: "xmark")?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .bold))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        closeButton.setImage(closeImage, for: .normal)
    }
    
    private func setupData() {
        vm.getListClass().sink { [weak self] listClass in
            guard let self = self else { return }
            self.listClass = listClass
        }
        .store(in: &cancellables)
    }
    
    // MARK: - IBAction
    
    @IBAction private func addButtonTapped(sender: UIButton) {
        guard let studentName = nameTextField.text, !studentName.isEmpty, let selectedClass = selectedClass else {
            return
        }
        let student = Student(name: studentName)
        vm.addStudent(student, toClass: selectedClass)
        vm.backToListStudent()
    }
}

extension AddStudentVC: UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listClass.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let aClass = listClass[row]
        return aClass.name
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard listClass.indices.contains(row) else {
            return
        }
        let aClass = listClass[row]
        classNameTextField.text = aClass.name
        selectedClass = aClass
        classNameTextField.resignFirstResponder()
    }
}
