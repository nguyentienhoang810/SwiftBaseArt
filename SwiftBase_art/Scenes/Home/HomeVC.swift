//
//  ViewController.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import Combine

class HomeVC: BaseVC {
    @IBOutlet private var tableView: UITableView!

    var vm: HomeVM!

    // MARK: - Private properties

    private let cellIdentifier = "HomeCell"
    private var cancellables = Set<AnyCancellable>()
    
    private var listClass: [Class] = [] {
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
        vm.showAddClass()
    }

    // MARK: - Private methods

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupData() {
        vm.getListClass().sink { [weak self] listClass in
            guard let self = self else { return }
            self.listClass = listClass
        }
        .store(in: &cancellables)
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClass.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let aClass = listClass[indexPath.row]
        cell.textLabel?.text = "\(aClass.name)"
        cell.detailTextLabel?.text = "\(aClass.students.count) students"
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.goToListStudent()
    }
}
