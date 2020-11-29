//
//  String.swift
//  SwiftBase_art
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

extension String {
    static func getTMDBMovieImage(path: String) -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/original" + path)
    }
}
