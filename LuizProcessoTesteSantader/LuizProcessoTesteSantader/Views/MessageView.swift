//
//  MessageView.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import Foundation
import UIKit


class MessageView:UIView{
    
    var upperLbl = UILabel()
    var titleLbl = UILabel()
    var newMsgBtn = UIButton()
    
    var innerView:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    var contactBtn = UIButton()
    var investBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let viewWidth = self.frame.width
        let viewHeight = self.frame.height
        
        self.addSubview(upperLbl)
        self.addSubview(titleLbl)
        self.addSubview(newMsgBtn)
        self.addSubview(innerView)
        
        innerView.addSubview(investBtn)
        innerView.addSubview(contactBtn)
        
        upperLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newMsgBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.setUpContraint(pattern: "V:|-\(viewHeight/4)-[v0(\(viewHeight/10))][v1(\(viewHeight/8))]-\(viewHeight/6)-[v2(\(viewHeight/10))]-30-[v3(\(viewHeight/10))]|", views: upperLbl,titleLbl,newMsgBtn, innerView)
        self.setUpContraint(pattern: "H:[v0(\(viewWidth/2))]", views: upperLbl)
        self.setUpContraint(pattern: "H:[v0(\(viewWidth))]", views: titleLbl)
        self.setUpContraint(pattern: "H:[v0(\(viewWidth/2))]", views: newMsgBtn)
        self.setUpContraint(pattern: "H:|[v0(\(viewWidth))]", views: innerView)
        
        innerView.setUpContraint(pattern: "V:[v0(\(viewHeight/11))]|", views: investBtn)
        innerView.setUpContraint(pattern: "V:[v0(\(viewHeight/10))]|", views: contactBtn)
        innerView.setUpContraint(pattern: "H:|[v0(\(viewWidth/2))][v1(\(viewWidth/2))]", views: investBtn, contactBtn)
        
    }
    
    func setElementsLayout(){
        
        upperLbl.text = "Obrigado!"
        upperLbl.textAlignment = .center
        upperLbl.textColor = .lightGray
        upperLbl.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        
        
        titleLbl.text = "Menssagem enviada \ncom sucesso :)"
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 2
        titleLbl.textColor = .darkGray
        titleLbl.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        
        newMsgBtn.backgroundColor = .clear
        newMsgBtn.setTitle("Enviar nova mensagem", for: .normal)
        newMsgBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        newMsgBtn.setTitleColor(.appRed, for: .normal)
        
        contactBtn.backgroundColor = .appDarkRed
        contactBtn.setTitle("Contato", for: .normal)
        investBtn.backgroundColor = .appRed
        investBtn.setTitle("Investimento", for: .normal)
        
    }
}
