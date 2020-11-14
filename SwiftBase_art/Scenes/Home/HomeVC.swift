//
//  ViewController.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    let subView = HomeView()
    var vm: HomeVM!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(subView)
        subView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        subView.nextBtn.addTarget(self, action: #selector(gotoList), for: .touchUpInside)
    }

    @objc func gotoList() {
        vm.gotoList()
    }

}

