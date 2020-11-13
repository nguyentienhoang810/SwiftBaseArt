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
    var appCoordinator: AppCoordinatorType?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigator = UINavigationController()
        appCoordinator = AppCoordinator(navigator: navigator, window: window!)
        appCoordinator?.start()
        
    }
}

