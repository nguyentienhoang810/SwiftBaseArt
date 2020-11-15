//
//  ListVC.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class ListVC: BaseVC {
    @IBOutlet private var tableView: UITableView!
    
    var vm: ListVM!
    
    // MARK: - Private properties
    
    private let cellIdentifier = "ListCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setTrailingNavButton()
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
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    // MARK: - UITableViewDelegate
}
