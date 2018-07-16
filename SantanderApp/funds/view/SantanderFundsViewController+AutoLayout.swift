////
////  SantanderFundsViewController+AutoLayout.swift
////  SantanderApp
////
////  Created by Andre Nogueira on 15/07/2018.
////  Copyright © 2018 Andre Nogueira. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//protocol SantanderViewAutoLayout{
//    
//    func insertIntoGreen1()
//    func insertIntoGreen2()
//    func insertIntoYellow()
//    func insertIntoOrange()
//    func insertIntoRed()
//}
//
//extension SantanderFundsViewController:SantanderViewAutoLayout{
//    func insertRiskIcon(){
//        
//        switch (self.risk)!{
//        case 1: insertIntoGreen1()
//        case 2: insertIntoGreen2()
//        case 3: insertIntoYellow()
//        case 4: insertIntoOrange()
//        case 5: insertIntoRed()
//        default: break
//        }
//    }
//    
//    func insertIntoGreen1(){
//        let riskState = UIImage(named: "risk")
//        let imgView = UIImageView(image: riskState)
//        self.addSubview(imgView)
//        imgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.riskgreen1)
//            make.bottom.equalTo(self.riskgreen1.snp.top)
//            make.leading.equalTo(self.riskgreen1).offset(20)
//        }
//    }
//    func insertIntoGreen2(){
//        let riskState = UIImage(named: "risk")
//        let imgView = UIImageView(image: riskState)
//        self.addSubview(imgView)
//        imgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.riskgreen2)
//            make.bottom.equalTo(self.riskgreen2.snp.top)
//            make.leading.equalTo(self.riskgreen2).offset(20)
//        }
//    }
//    
//    func insertIntoYellow(){
//        let riskState = UIImage(named: "risk")
//        let imgView = UIImageView(image: riskState)
//        self.addSubview(imgView)
//        imgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.riskyellow)
//            make.bottom.equalTo(self.riskyellow.snp.top)
//            make.leading.equalTo(self.riskyellow).offset(20)
//        }
//    }
//    
//    func insertIntoOrange(){
//        
//        let riskState = UIImage(named: "risk")
//        let imgView = UIImageView(image: riskState)
//        self.addSubview(imgView)
//        imgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.riskorange)
//            make.bottom.equalTo(self.riskorange.snp.top)
//            make.leading.equalTo(self.riskorange).offset(20)
//        }
//        
//    }
//    
//    func insertIntoRed(){
//        
//        let riskState = UIImage(named: "risk")
//        let imgView = UIImageView(image: riskState)
//        self.addSubview(imgView)
//        imgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.riskred)
//            make.bottom.equalTo(self.riskred.snp.top)
//            make.leading.equalTo(self.riskred).offset(20)
//        }
//        
//        
//    }
//    
//    
//}
//
