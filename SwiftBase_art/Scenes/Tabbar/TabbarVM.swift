//
//  TabbarVM.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

class TabbarVM: ViewModel {
    typealias VC = UIViewController
    typealias Navi = TabbarNavi

    var navi: TabbarNavi
    var vc: UIViewController?

    required init(coordinator: TabbarNavi) {
        navi = coordinator
    }
}
