//
//  BaseNC.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
