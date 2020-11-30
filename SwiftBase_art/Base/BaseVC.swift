//
//  BaseVC.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import SVProgressHUD
import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
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

    func startLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            SVProgressHUD.setDefaultMaskType(.clear)
            SVProgressHUD.show()
        }
    }

    func stopLoading() {
        if SVProgressHUD.isVisible() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                SVProgressHUD.dismiss()
            }
        }
    }
}
