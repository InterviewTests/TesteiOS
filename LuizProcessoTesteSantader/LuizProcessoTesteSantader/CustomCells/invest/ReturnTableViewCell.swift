//
//  ReturnTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class ReturnTableViewCell: UITableViewCell {

    static let identifier = "ReturnTableViewCell"
    
    var headerLbl = UILabel()
    var fundLbl = UILabel()
    var cdiLbl = UILabel()
    
    var innerView = UIView()
    
    var monthView:ReturnView?
    var yearView:ReturnView?
    var twelveView:ReturnView?
    
    var border = UIView()
    
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
        
        self.contentView.addSubview(headerLbl)
        self.contentView.addSubview(innerView)
        self.contentView.addSubview(monthView!)
        self.contentView.addSubview(yearView!)
        self.contentView.addSubview(twelveView!)
        self.contentView.addSubview(border)
        
        innerView.addSubview(fundLbl)
        innerView.addSubview(cdiLbl)
        
        headerLbl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        innerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        monthView!.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        yearView!.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        twelveView!.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        border.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        print(cellWidth)
        self.contentView.setUpContraint(pattern: "V:|-20-[v0(\(cellHeight/5))]-5-[v1(\(cellHeight))][v2(\(cellHeight/2))]-2-[v3(\(cellHeight/2))]-2-[v4(\(cellHeight/2))]-5-[v5(\(cellHeight/5))]", views: headerLbl,innerView,monthView!,yearView!,twelveView!,border)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: headerLbl)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth*1.35))]", views: innerView)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth*1.17))]", views: monthView!)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth*1.17))]", views: yearView!)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth*1.17))]", views: twelveView!)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: border)
        
        innerView.setUpContraint(pattern: "H:[v0(\(cellWidth/6))]-10-[v1(\(cellWidth/6))]|", views: fundLbl,cdiLbl)
        innerView.setUpContraint(pattern: "V:|[v0(\(cellHeight))]", views: fundLbl)
        innerView.setUpContraint(pattern: "V:|[v0(\(cellHeight))]", views: cdiLbl)
        
        
    }
    
    func setElementsLayout(){
        
        monthView = ReturnView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height/6))
        yearView = ReturnView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height/6))
        twelveView = ReturnView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height/6))

        headerLbl.textAlignment = .center
        headerLbl.textColor = .darkGray
        headerLbl.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        cdiLbl.textAlignment = .right
        cdiLbl.textColor = .darkGray
        cdiLbl.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        
        fundLbl.textAlignment = .right
        fundLbl.textColor = .darkGray
        fundLbl.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        bottomBorder.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 1)
        border.layer.addSublayer(bottomBorder)
        
    }
}
