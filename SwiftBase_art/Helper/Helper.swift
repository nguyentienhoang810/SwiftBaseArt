//
//  Helper.swift
//  SwiftBase_art
//
//  Created by Apple on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigator: UINavigationController?  { get set }
    
    init(navigator: UINavigationController?)
    
    func start()
}

protocol ViewModel: ObservableObject {
    associatedtype Navi: Coordinator
    
    var navi: Navi { get set }
    
    init(coordinator: Navi)
    
    func start()
}

extension ViewModel {
    func start() {
        navi.start()
    }
}
