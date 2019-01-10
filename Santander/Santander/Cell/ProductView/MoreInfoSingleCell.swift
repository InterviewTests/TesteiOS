//
//  MoreInfoSingleCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class MoreInfoSingleCell: BaseCell {
    
    /// The left information of the cell
    private let labelLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
     /// The right information of the cell
    private let labelRight: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(labelLeft)
        self.contentView.addSubview(labelRight)
        
        NSLayoutConstraint.activate([
            labelLeft.topAnchor    .constraint(equalTo: self.contentView.topAnchor    , constant:5),
            labelLeft.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor , constant:-10),
            labelLeft.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:15),
            
            labelRight.centerYAnchor.constraint(equalTo: labelLeft.centerYAnchor),
            labelRight.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:-15),
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
    func setupCell(for info:Info?){
        labelLeft .text = info?.name
        labelRight.text = info?.data
    }
}
