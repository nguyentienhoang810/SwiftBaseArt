//
//  ScreenTransitionManager.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/23/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct ScreenTransitionManager {
    static func switchScreenFollowLoginState() {
        guard let window = SceneDelegate.shared?.window else {
            return
        }
        let assembler = AppAssembler()
        let appVM = assembler.initVM(window: window)
        appVM.start()
    }
}
