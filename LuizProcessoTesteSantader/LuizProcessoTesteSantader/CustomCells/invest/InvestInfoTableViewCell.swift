//
//  InvestInfoTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class InvestInfoTableViewCell: UITableViewCell {

   
    static let identifier = "InvestInfoTableViewCell"
    
    var title = UILabel()
    var infoDettail = UILabel()
    
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
        
        contentView.addSubview(title)
        contentView.addSubview(infoDettail)
        
        contentView.setUpContraint(pattern: "H:|-10-[v0(\(cellWidth/2))][v1(\(cellWidth/4))]-10-|", views: title, infoDettail)
        contentView.setUpContraint(pattern: "V:|[v0(\(20))]", views: title)
        contentView.setUpContraint(pattern: "V:|[v0(\(20))]", views: infoDettail)
        
        
    }
    func setElementsLayout(){
        
        title.textAlignment = .left
        title.textColor = .darkGray
        title.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        
        infoDettail.textAlignment = .right
        infoDettail.textColor = .darkGray
        infoDettail.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        
    }
    
}
