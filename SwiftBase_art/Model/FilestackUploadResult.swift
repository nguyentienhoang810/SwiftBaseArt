//
//  FilestackUploadResult.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/2/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct FilestackUploadResult: Codable {
    var url: String?
    var size: Int?
    var type: String?
    var filename: String?
    var key: String?
}
