//
//  InvestView.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 27/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import Foundation
import UIKit

class InvestView:UIView{
    
    var table = UITableView()
    
    
    var innerView:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    var contactBtn = UIButton()
    var investBtn = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        table.separatorStyle = .none
        table.allowsSelection = false
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let viewWidth = self.frame.width
        let viewHeight = self.frame.height

        self.addSubview(table)
        self.addSubview(innerView)
        innerView.addSubview(investBtn)
        innerView.addSubview(contactBtn)
        
        print(viewWidth)
        
        self.setUpContraint(pattern: "V:|[v0(\(viewHeight))][v1(\(viewHeight/10))]|", views: table, innerView)
        self.setUpContraint(pattern: "H:|[v0(\(viewWidth))]|", views: table)
        self.setUpContraint(pattern: "H:|[v0(\(viewWidth))]", views: innerView)
  
        innerView.setUpContraint(pattern: "H:|[v0(\(viewWidth/2))][v1(\(viewWidth/2))]", views: investBtn,contactBtn)
        innerView.setUpContraint(pattern: "V:[v0(\(viewHeight/10))]|", views: investBtn)
        innerView.setUpContraint(pattern: "V:[v0(\(viewHeight/11))]|", views: contactBtn)
    
    
    }
    
    func setElementsLayout(){
        contactBtn.backgroundColor = .appRed
        contactBtn.setTitle("Contato", for: .normal)
        investBtn.backgroundColor = .appDarkRed
        investBtn.setTitle("Investimento", for: .normal)
    }
}
