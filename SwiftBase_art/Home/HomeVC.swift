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
    
    let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeView)
        homeView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        homeView.nextBtn.addTarget(self, action: #selector(gotoList), for: .touchUpInside)
    }

    @objc func gotoList() {
        let listVC = ListVC()
        navigationController?.pushViewController(listVC, animated: true)
    }

}

