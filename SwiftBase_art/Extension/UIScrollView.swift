//
//  UIScrollView.swift
//  SwiftBase_art
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

extension UIScrollView {
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return contentOffset.y + frame.size.height + edgeOffset > contentSize.height
    }
}
