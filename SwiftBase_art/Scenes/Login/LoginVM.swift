//
//  LoginVM.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import Combine

class LoginVM: ViewModel {
    typealias Navi = LoginNavi

    var navi: LoginNavi

    required init(coordinator: LoginNavi) {
        navi = coordinator
    }
    
    func login(phoneNumber: String) {
    }
}
