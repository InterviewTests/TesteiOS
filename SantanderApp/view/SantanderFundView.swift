//
//  SantanderFundView.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 30/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import SnapKit
protocol SantanderViewAutoLayout{
    
    func insertIntoGreen1()
    func insertIntoGreen2()
    func insertIntoYellow()
    func insertIntoOrange()
    func insertIntoRed()
}
class SantanderFundView: UIView {
    
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var fundName: UILabel!
    
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var investmentLevel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    @IBOutlet weak var monthlyFund: UILabel!
    @IBOutlet weak var annuallyFund: UILabel!
    @IBOutlet weak var twelveMonthsFund: UILabel!
    
    @IBOutlet weak var monthlyCDI: UILabel!
    @IBOutlet weak var annuallyCDI: UILabel!
    @IBOutlet weak var twelveMonthsCDI: UILabel!
    
    @IBOutlet weak var riskgreen1: UIImageView!
    @IBOutlet weak var riskgreen2: UIImageView!
    @IBOutlet weak var riskyellow: UIImageView!
    @IBOutlet weak var riskorange: UIImageView!
    @IBOutlet weak var riskred: UIImageView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableToInvestButtonConstraint: UIScrollView!
    
    var risk: Int?
    
    func startFundView(subtitle: String, fundName: String, whatIs: String, riskTitle: String, definitionLabel: String, moreInfo: String, risk: Int){
        self.topTitle.text = "Investimento"
        self.subtitle.text = subtitle
        self.fundName.text = fundName
        self.whatIsLabel.text = whatIs
        self.investmentLevel.text = riskTitle
        self.definitionLabel.text = definitionLabel
        self.moreInfoLabel.text = moreInfo
        
        self.risk = risk
        self.insertRiskIcon()
    }
    
    func startFundStats(monthlyFund : String, annuallyFund: String, twelveMonthsFund: String){
        self.monthlyFund.text = monthlyFund
        self.annuallyFund.text = annuallyFund
        self.twelveMonthsFund.text = twelveMonthsFund
    }
    
    func startCDIStats(monthlyCDI: String, annuallyCDI: String, twelveMonthsCDI: String){
        self.monthlyCDI.text = monthlyCDI
        self.annuallyCDI.text = annuallyCDI
        self.twelveMonthsCDI.text = twelveMonthsCDI
    }
    
    func insertRiskIcon(){
        
        switch (self.risk)!{
        case 1: insertIntoGreen1()
        case 2: insertIntoGreen2()
        case 3: insertIntoYellow()
        case 4: insertIntoOrange()
        case 5: insertIntoRed()
        default: break
        }
    }
    
}

extension SantanderFundView: SantanderViewAutoLayout{
    
    func insertIntoGreen1(){
        let riskState = UIImage(named: "risk")
        let imgView = UIImageView(image: riskState)
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.riskgreen1)
            make.bottom.equalTo(self.riskgreen1.snp.top)
            make.leading.equalTo(self.riskgreen1).offset(20)
        }
    }
    func insertIntoGreen2(){
        let riskState = UIImage(named: "risk")
        let imgView = UIImageView(image: riskState)
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.riskgreen2)
            make.bottom.equalTo(self.riskgreen2.snp.top)
            make.leading.equalTo(self.riskgreen2).offset(20)
        }
    }
    
    func insertIntoYellow(){
        let riskState = UIImage(named: "risk")
        let imgView = UIImageView(image: riskState)
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.riskyellow)
            make.bottom.equalTo(self.riskyellow.snp.top)
            make.leading.equalTo(self.riskyellow).offset(20)
        }
    }
    
    func insertIntoOrange(){
        
        let riskState = UIImage(named: "risk")
        let imgView = UIImageView(image: riskState)
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.riskorange)
            make.bottom.equalTo(self.riskorange.snp.top)
            make.leading.equalTo(self.riskorange).offset(20)
        }
    
    }
    
    func insertIntoRed(){
        
        let riskState = UIImage(named: "risk")
        let imgView = UIImageView(image: riskState)
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.riskred)
            make.bottom.equalTo(self.riskred.snp.top)
            make.leading.equalTo(self.riskred).offset(20)
        }
        
        
    }
}

