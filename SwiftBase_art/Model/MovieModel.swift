//
//  Movie.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct MovieListModel: Codable {
    var totalResults: Int?
    var page: Int?
    var totalPages: Int?
    var results: [MovieModel]?

    func getNextPage() -> Int {
        return (page ?? 0) + 1
    }

    func getPage() -> Int {
        return page ?? 1
    }

    func getTotalPages() -> Int {
        return totalPages ?? 1
    }
}

struct MovieModel: Codable {
    var voteAverage: Double?
    var popularity: Double?
    var voteCount: Int?
    var releaseDate: String?
    var title: String?
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var overview: String?
    var id: Int?
    var originalTitle: String?
    var posterPath: String?
    var originalLanguage: String?
    var video: Bool?
}
