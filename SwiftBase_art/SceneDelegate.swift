//
//  SceneDelegate.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/13/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var assembler: Assembler = {
        return MainAssembler()
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            self.window = window
            let appVM: AppVM = assembler.initVM(window: window)
            /*
             xử lý điều hướng
             ví dụ:
             - Chưa login -> qua login
             - Đã login -> qua home
             */
            appVM.directToHome()

        }
    }
}

