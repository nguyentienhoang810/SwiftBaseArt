//
//  UITableView.swift
//  SwiftBase_art
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(aClass: T.Type) {
        let nib = UINib(nibName: aClass.className, bundle: nil)
        register(nib, forCellReuseIdentifier: aClass.className)
    }

    func dequeue<T: UITableViewCell>(aClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
}
