//
//  HeaderTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    static let identifier = "HeaderTableViewCell"
    
    var upperTitle = UILabel()
    var title = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let cellWidth = self.contentView.frame.size.width
        let cellHeight = self.contentView.frame.size.height
        
        self.contentView.addSubview(upperTitle)
        self.contentView.addSubview(title)
        
        upperTitle.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true

        self.contentView.setUpContraint(pattern: "V:|[v0(\(cellHeight))][v1(\(cellHeight*1.5))]", views: upperTitle,title)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: upperTitle)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: title)
        
    }
    
    func setElementsLayout(){

        upperTitle.textAlignment = .center
        upperTitle.textColor = .darkGray
        upperTitle.font = UIFont(name: "HelveticaNeue-Light", size: 15)
    
        title.textAlignment = .center
        title.numberOfLines = 2
        title.textColor = .darkGray
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        
    }
    
    
}
