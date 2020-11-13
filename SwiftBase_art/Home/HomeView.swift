//
//  HomeView.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: BaseView {
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("NEXT", for: .normal)
        btn.backgroundColor = .red
        return btn
    }()
    
    override func setupView() {
        backgroundColor = .orange
        self.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
            make.centerY.equalTo(self)
        }
    }
    
    
}
