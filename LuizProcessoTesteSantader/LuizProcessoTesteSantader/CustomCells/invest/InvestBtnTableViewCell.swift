//
//  InvestBtnTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class InvestBtnTableViewCell: UITableViewCell {

    static let identifier = "InvestBtnTableViewCell"
    var btn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let cellWidth = contentView.frame.width
        let cellHeigt = contentView.frame.height
        
        self.contentView.addSubview(btn)
    
        self.contentView.setUpContraint(pattern: "V:|-30-[v0(\(cellHeigt))]", views: btn)
        self.contentView.setUpContraint(pattern: "H:|-50-[v0(\(cellWidth/1.2))]", views: btn)
        
    }
    
    func setElementsLayout(){
        
        btn.backgroundColor = .appRed
        btn.layer.cornerRadius = 20.0
        btn.setTitle("Investir", for: .normal)
    }
    
}
