//
//  LoginNavi.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct LoginNavi: Coordinator {
    weak var navigator: UINavigationController?

    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }

    func start() {
        let vc = LoginAssembler().initVC(coordinator: self)
        navigator?.pushViewController(vc, animated: false)
    }
}
