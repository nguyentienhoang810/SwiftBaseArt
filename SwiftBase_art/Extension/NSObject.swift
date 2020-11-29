//
//  NSObject.swift
//  SwiftBase_art
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        var className = String(describing: type(of: self))
        if let genericCharacterIndex = className.firstIndex(of: "<") {
            className = String(className[...className.index(before: genericCharacterIndex)])
        }
        return className
    }

    static var className: String {
        var className = String(describing: Self.self)
        if let genericCharacterIndex = className.firstIndex(of: "<") {
            className = String(className[...className.index(before: genericCharacterIndex)])
        }
        return className
    }
}
