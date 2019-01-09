//
//  BaseCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    var item:FormItem?
    var topSpacing:NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The space between the cells and the views inside them
    func setupTopSpace(_ item:FormItem){
        topSpacing?.constant = CGFloat(item.topSpacing ?? 0)
    }
}

