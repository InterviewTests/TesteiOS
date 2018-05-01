//
//  SantanderFundView.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 30/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

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
    
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    func startFundView(subtitle: String, fundName: String, whatIs: String, riskTitle: String, definitionLabel: String, moreInfo: String){
        self.topTitle.text = "Investimento"
        self.subtitle.text = subtitle
        self.fundName.text = fundName
        self.whatIsLabel.text = whatIs
        self.investmentLevel.text = riskTitle
        self.definitionLabel.text = definitionLabel
        self.moreInfoLabel.text = moreInfo
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
    
    
}
