//
//  TabbarNavi.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct TabbarNavi: Coordinator {
    weak var navigator: UINavigationController?

    private var movieListNavigator = BaseNC()
    private var profileNavigator = BaseNC()

    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }

    func start() {
        let tabbarVC = TabbarAssembler().initVC(coordinator: self)
        navigator?.pushViewController(tabbarVC, animated: false)
        let movieListNavi = MovieListNavi(navigator: movieListNavigator)
        movieListNavi.start()
        let profileNavi = ProfileNavi(navigator: profileNavigator)
        profileNavi.start()
        tabbarVC.viewControllers = [movieListNavigator, profileNavigator]
    }
}
