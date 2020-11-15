//
//  Student.swift
//  SwiftBase_art
//
//  Created by Apple on 11/15/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct Student: Identifiable {
    var id = UUID().uuidString
    var name: String
}
