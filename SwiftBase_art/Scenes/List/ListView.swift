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
    
    lazy var backBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("BACK", for: .normal)
        btn.backgroundColor = .orange
        return btn
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.top.equalTo(self).offset(100)
        }
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}