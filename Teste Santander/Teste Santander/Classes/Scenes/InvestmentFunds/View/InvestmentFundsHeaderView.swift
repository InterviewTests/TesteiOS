//
//  InvestmentFundsHeader.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

class InvestmentFundsHeaderView: UIView {
    // MARK: - Properties
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFundName: UILabel!
    @IBOutlet weak var lblWhatIs: UILabel!
    @IBOutlet weak var lblDefinition: UILabel!
    @IBOutlet weak var lblRiskTitle: UILabel!
    @IBOutlet weak var riskView: InvestmentRiskView!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    // MARK: - Public Methods
    func setup(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, investmentValue: Int) {
        lblTitle.text = title
        lblFundName.text = fundName
        lblWhatIs.text = whatIs
        lblDefinition.text = definition
        lblRiskTitle.text = riskTitle
        
        riskView.setup(graduationRisk: GraduationColorsEnum(rawValue: investmentValue) ?? GraduationColorsEnum.lightGreen)
    }
}
