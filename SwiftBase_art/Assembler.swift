//
//  Assembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

protocol Assembler {
    associatedtype VC: UIViewController
    associatedtype VM: ViewModel
    associatedtype Navi: Coordinator
    
    func initVC(coordinator: Navi) -> VC
    func initVM(coordinator: Navi) -> VM
}
