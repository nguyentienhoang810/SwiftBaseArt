//
//  MovieListCell.swift
//  SwiftBase_art
//
//  Created by Apple on 11/28/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet private var movieImgView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setContent(movie: MovieModel) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        if let posterPath = movie.posterPath, let imageUrl = String.getTMDBMovieImage(path: posterPath) {
            movieImgView.downloadImage(url: imageUrl, size: nil)
        }
    }

    // MARK: - Private methods

    private func setupUI() {
        movieImgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        movieImgView.layer.masksToBounds = true
        movieImgView.layer.cornerRadius = 8
    }
}
