//
//  ListView.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import SnapKit

class ListView: BaseView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    override func setupView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
