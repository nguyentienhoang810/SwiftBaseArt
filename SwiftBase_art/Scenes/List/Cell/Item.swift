//
//  Item.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class Item: UITableViewCell {
    
    lazy var avatarImg: UIImageView = {
       let img = UIImageView()
        
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.
    }
}
