//
//  BaseVC.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import SnapKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTrailingNavButton() {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(trailingNavButtonTapped))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func trailingNavButtonTapped() {}
    
    @IBAction func close() {
        if let nc = navigationController {
            nc.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
