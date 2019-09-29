//
//  SendTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 26/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class SendTableViewCell: UITableViewCell {
    
    static let identifier = "SendTableViewCell"
    var checkBox = UIButton()
    var sendBtn = UIButton()
    var label = UILabel()
    var innerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElementsLayout(){
        
        checkBox.backgroundColor = .clear
        checkBox.layer.cornerRadius = 5.0
        checkBox.layer.borderWidth = 1.0
        checkBox.layer.borderColor = UIColor.gray.cgColor
        checkBox.addTarget(self, action: #selector(selectedBox), for: .touchUpInside)
        
        sendBtn.backgroundColor = .appRed
        sendBtn.layer.cornerRadius = 20.0
        
        innerView.backgroundColor = .clear
    }
    
    func setUpView(){
        
        let cellWidth = contentView.frame.width
        let cellHeigt = contentView.frame.height
        
        innerView.addSubview(checkBox)
        innerView.addSubview(label)
        
        self.contentView.addSubview(innerView)
        self.contentView.addSubview(sendBtn)
        
        sendBtn.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        innerView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        innerView.setUpContraint(pattern: "H:[v0(\(cellWidth/16))]-5-[v1(\(cellWidth/1.2))]", views: checkBox,label)
        innerView.setUpContraint(pattern: "V:|-3-[v0(\(cellHeigt/2.5))]", views: checkBox)
        innerView.setUpContraint(pattern: "V:|-5-[v0(\(cellHeigt/3))]", views: label)
        
        self.contentView.setUpContraint(pattern: "V:|-30-[v0(\(cellHeigt/2))]-25-[v1(\(cellHeigt))]", views: innerView, sendBtn)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: innerView)
        self.contentView.setUpContraint(pattern: "H:[v0(\(cellWidth/1.2))]", views: sendBtn)
    }
    
    @objc func selectedBox(){
        
        if(checkBox.backgroundColor == .appRed){
            checkBox.backgroundColor = .clear
        }else{
        checkBox.backgroundColor = .appRed
        }
    }
}
