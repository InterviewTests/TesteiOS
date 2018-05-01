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
    
    func startFundView(subtitle: String, fundName: String, whatIs: String, riskTitle: String, definitionLabel: String){
        self.topTitle.text = "Investimento"
        self.subtitle.text = subtitle
        self.fundName.text = fundName
        self.whatIsLabel.text = whatIs
        self.investmentLevel.text = riskTitle
        self.definitionLabel.text = definitionLabel
    }
}
