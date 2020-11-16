//
//  AddStudentNavi.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

struct AddStudentNavi: Coordinator {
    weak var navigator: UINavigationController?
    
    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }
    
    func start() {
        let vc = AddStudentAssembler().initVC(coordinator: self)
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        navigator?.present(nc, animated: true, completion: nil)
    }
    
    func backToListStudent() {
        navigator?.dismiss(animated: true, completion: nil)
    }
}
