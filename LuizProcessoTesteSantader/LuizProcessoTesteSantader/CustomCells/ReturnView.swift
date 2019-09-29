//
//  ReturnView.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import Foundation
import UIKit

class ReturnView:UIView{
    
    var intervalo = UILabel()
    var fundReturn = UILabel()
    var cdiReturn = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let viewWidth = self.frame.size.width
        let viewHeight = self.frame.size.height
        
        self.addSubview(intervalo)
        self.addSubview(fundReturn)
        self.addSubview(cdiReturn)
        
        self.setUpContraint(pattern: "H:|-10-[v0(\(viewWidth/2))]-50-[v1(\(viewWidth/5))][v2(\(viewWidth/6))]-10-|", views: intervalo,fundReturn,cdiReturn)
        self.setUpContraint(pattern: "V:|[v0(\(viewHeight*2))]", views: intervalo)
        self.setUpContraint(pattern: "V:|[v0(\(viewHeight*2))]", views: fundReturn)
        self.setUpContraint(pattern: "V:|[v0(\(viewHeight*2))]", views: cdiReturn)
        
        
    }
    
    func setElementsLayout(){
        
        intervalo.textAlignment = .left
        intervalo.textColor = .darkGray
        intervalo.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        
        fundReturn.textAlignment = .right
        fundReturn.textColor = .darkGray
        fundReturn.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        
        cdiReturn.textAlignment = .right
        cdiReturn.textColor = .darkGray
        cdiReturn.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        
    }
    
}
