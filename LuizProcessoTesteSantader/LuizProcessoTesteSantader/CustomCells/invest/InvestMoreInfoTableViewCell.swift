//
//  InvestMoreInfoTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class InvestMoreInfoTableViewCell: UITableViewCell {

   static let identifier = "InvestMoreInfoTableViewCell"
    
    var title = UILabel()
    var downLoadImg = UIButton()
    
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
        contentView.addSubview(downLoadImg)
        
        contentView.setUpContraint(pattern: "H:|-10-[v0(\(cellWidth/2))][v1(\(cellWidth/4))]-10-|", views: title, downLoadImg)
        contentView.setUpContraint(pattern: "V:|[v0(\(20))]", views: title)
        contentView.setUpContraint(pattern: "V:|-5-[v0(\(20))]", views: downLoadImg)
        
    }
    func setElementsLayout(){
        
        title.textAlignment = .left
        title.textColor = .darkGray
        title.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        
        //downLoadImg.setBackgroundImage(UIImage(named: "downArrow"), for: .normal)
        downLoadImg.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        downLoadImg.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        downLoadImg.titleLabel?.textAlignment = .right
        downLoadImg.setTitle("Baixar", for: .normal)
        downLoadImg.setTitleColor(.appRed, for: .normal)
        downLoadImg.contentMode = .scaleAspectFit
        downLoadImg.backgroundColor = .clear
        
    }
}
