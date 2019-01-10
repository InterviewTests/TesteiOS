//
//  UILabelCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class UILabelCell: BaseCell {
    
    /// The UILabel
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(label)
        
        topSpacing = label.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        NSLayoutConstraint.activate([
            topSpacing!,
            label.bottomAnchor .constraint(equalTo:  self.contentView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            label.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.2),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets up the cell information
    func setupCell(_ item:FormItem){
        topSpacing?.constant = CGFloat(item.topSpacing ?? 0)
        label.text = item.message
    }
    
}

