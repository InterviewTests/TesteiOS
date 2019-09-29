//
//  TxtFieldTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 26/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class TxtFieldTableViewCell: UITableViewCell {
    
    static let identifier = "TxtFieldTableViewCell"
    var txtField = UITextField()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setElementsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let cellWidth = self.contentView.frame.size.width
        let cellHeight = self.contentView.frame.size.height
        
//        let centerX = self.contentView.centerXAnchor.
        
        contentView.addSubview(txtField)
        
        txtField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: txtField)
        contentView.setUpContraint(pattern: "V:|-\(cellHeight/2)-[v0(\(cellHeight))]", views: txtField)
        
        
    }
    
    func setElementsLayout(){
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.gray.cgColor
        bottomBorder.frame = CGRect(x: 0, y: txtField.center.y+self.contentView.frame.height, width: self.contentView.frame.width, height: 1)
        txtField.layer.addSublayer(bottomBorder)
        
    }
}
