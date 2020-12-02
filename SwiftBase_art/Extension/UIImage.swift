//
//  UIImage.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

extension UIImage {
    func compressData(to expectedBytes: Int) -> Data? {
        var quality: CGFloat = 1
        while quality >= 0 {
            guard let data = jpegData(compressionQuality: quality) else { return nil }
            if data.count >= expectedBytes {
                quality -= 0.1
            } else {
                return data
            }
        }
        return nil
    }

    func resizedImage(for size: CGSize) -> UIImage {
        guard let image = cgImage else { return self }
        let context = CGContext(data: nil,
                                width: Int(size.width),
                                height: Int(size.height),
                                bitsPerComponent: image.bitsPerComponent,
                                bytesPerRow: image.bytesPerRow,
                                space: image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!,
                                bitmapInfo: image.bitmapInfo.rawValue)
        context?.interpolationQuality = .high
        context?.draw(image, in: CGRect(origin: .zero, size: size))

        guard let scaledImage = context?.makeImage() else { return self }

        return UIImage(cgImage: scaledImage)
    }
}
