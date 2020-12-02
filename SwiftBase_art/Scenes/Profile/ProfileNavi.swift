//
//  ProfileNavi.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct ProfileNavi: Coordinator {
    weak var navigator: UINavigationController?

    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }

    func start() {
        let vc = ProfileAssembler().initVC(coordinator: self)
        vc.title = "Profile"
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        navigator?.pushViewController(vc, animated: false)
    }
}
