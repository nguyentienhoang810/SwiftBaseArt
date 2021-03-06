//
//  MovieListNavi.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

struct MovieListNavi: Coordinator {
    weak var navigator: UINavigationController?

    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }

    func start() {
        let vc = MovieListAssembler().initVC(coordinator: self)
        vc.title = "Movie List"
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        navigator?.pushViewController(vc, animated: false)
    }
}
