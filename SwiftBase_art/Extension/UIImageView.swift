//
//  UIImageView.swift
//  SwiftBase_art
//
//  Created by Apple on 11/28/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func showImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
//    func downloadImage(url: URL, size: CGSize?, placeholder: UIImage? = nil, indicator: Bool = false) {
//        var kingFisherOptionInfo: KingfisherOptionsInfo = [
//            .scaleFactor(kScreen.scale),
//            .transition(.fade(1)),
//            .cacheOriginalImage,
//        ]
//        if let size = size {
//            let processor = DownsamplingImageProcessor(size: size)
//            kingFisherOptionInfo.append(.processor(processor))
//        }
//        kf.indicatorType = indicator ? .activity : .none
//        kf.setImage(
//            with: url,
//            placeholder: placeholder,
//            options: kingFisherOptionInfo
//            , completionHandler: {
//                result in
//                switch result {
//                case let .success(value):
//                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
//                case let .failure(error):
//                    print("Job failed: \(error.localizedDescription)")
//                }
//            })
//    }
}
