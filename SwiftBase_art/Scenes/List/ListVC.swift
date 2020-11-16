//
//  ListVC.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import Combine

class ListVC: BaseVC {
    @IBOutlet private var tableView: UITableView!
    
    var vm: ListVM!
    var aClass: Class?
    
    // MARK: - Private properties
    
    private let cellIdentifier = "ListCell"
    private var cancellables = Set<AnyCancellable>()
    
    private var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTrailingNavButton()
        setupTableView()
        setupData()
    }
    
    override func trailingNavButtonTapped() {
        vm.showAddStudent()
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupData() {
        if let aClass = aClass {
            vm.getListStudent(from: aClass).sink { [weak self] students in
                guard let self = self else { return }
                self.students = students
            }
            .store(in: &cancellables)
        }
    }
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        return cell
    }
    
    // MARK: - UITableViewDelegate
}
