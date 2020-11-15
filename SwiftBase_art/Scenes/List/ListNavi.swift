//
//  ListCoordinator.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct ListNavi: Coordinator {
    weak var navigator: UINavigationController?
    
    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }
    
    func start() {
        let vc = ListAssembler().initVC(coordinator: self)
        vc.title = "List Student"
        navigator?.pushViewController(vc, animated: true)
    }
}
