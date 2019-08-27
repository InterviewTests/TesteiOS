//
//  FundViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 24/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit


class FundViewCell: UITableViewCell, FundCell {
    
    @IBOutlet var fundTitleLabel: UILabel!
    @IBOutlet var fundNameLabel: UILabel!
    @IBOutlet var whatisLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    @IBOutlet var risktitleLabel: UILabel!
    @IBOutlet var infotitleLabel: UILabel!
    @IBOutlet var infoStackView: UIStackView!
    
    @IBOutlet var risk1View: UIView!
    @IBOutlet var risk2View: UIView!
    @IBOutlet var risk3View: UIView!
    @IBOutlet var risk4View: UIView!
    @IBOutlet var risk5View: UIView!
    
    @IBOutlet var risk1heightConstraint: NSLayoutConstraint!
    @IBOutlet var risk2heightConstraint: NSLayoutConstraint!
    @IBOutlet var risk3heightConstraint: NSLayoutConstraint!
    @IBOutlet var risk4heightConstraint: NSLayoutConstraint!
    @IBOutlet var risk5heightConstraint: NSLayoutConstraint!
    
    @IBOutlet var risk1IndicatorArrow: UIImageView!
    @IBOutlet var risk2IndicatorArrow: UIImageView!
    @IBOutlet var risk3IndicatorArrow: UIImageView!
    @IBOutlet var risk4IndicatorArrow: UIImageView!
    @IBOutlet var risk5IndicatorArrow: UIImageView!
    
    
    let riskNotSelectedHeight: CGFloat = 8
    let riskSelectedHeight: CGFloat = 14
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let theme = ThemeManager.current()
        risk1View.backgroundColor = theme.fundRisk1Color
        risk2View.backgroundColor = theme.fundRisk2Color
        risk3View.backgroundColor = theme.fundRisk3Color
        risk4View.backgroundColor = theme.fundRisk4Color
        risk5View.backgroundColor = theme.fundRisk5Color
        
        risk1IndicatorArrow.image = risk1IndicatorArrow.image?.maskWithColor(theme.fundPrimaryTextColor)
        risk2IndicatorArrow.image = risk1IndicatorArrow.image?.maskWithColor(theme.fundPrimaryTextColor)
        risk3IndicatorArrow.image = risk1IndicatorArrow.image?.maskWithColor(theme.fundPrimaryTextColor)
        risk4IndicatorArrow.image = risk1IndicatorArrow.image?.maskWithColor(theme.fundPrimaryTextColor)
        risk5IndicatorArrow.image = risk1IndicatorArrow.image?.maskWithColor(theme.fundPrimaryTextColor)
        
        fundTitleLabel.textColor = theme.fundPrimaryTextColor
//        fundNameLabel.textColor = theme.primaryTextColor
        whatisLabel.textColor = theme.fundPrimaryTextColor
        definitionLabel.textColor = theme.fundSecondaryTextColor
        risktitleLabel.textColor = theme.fundPrimaryTextColor
        infotitleLabel.textColor = theme.fundPrimaryTextColor
        
        fundTitleLabel.font = theme.fundPrimaryFont.withSize(fundTitleLabel.font.pointSize)
        fundNameLabel.font = theme.fundPrimaryFont.withSize(fundNameLabel.font.pointSize)
        whatisLabel.font = theme.fundPrimaryFont
        definitionLabel.font = theme.fundPrimaryFont
        risktitleLabel.font = theme.fundPrimaryFont
        infotitleLabel.font = theme.fundPrimaryFont
        
    }
    
    
    func configure(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, infoTitle: String, riskIndex: Int, monthInfo: (String, String), yearInfo: (String, String), twelveMonths: (String, String)) {
        fundTitleLabel.text = title
        fundNameLabel.text = fundName
        whatisLabel.text = whatIs
        definitionLabel.text = definition
        risktitleLabel.text = riskTitle
        infotitleLabel.text = infoTitle
        
        risk1heightConstraint.constant = riskNotSelectedHeight
        risk2heightConstraint.constant = riskNotSelectedHeight
        risk3heightConstraint.constant = riskNotSelectedHeight
        risk4heightConstraint.constant = riskNotSelectedHeight
        risk4heightConstraint.constant = riskNotSelectedHeight
        risk1IndicatorArrow.alpha = 0
        risk2IndicatorArrow.alpha = 0
        risk3IndicatorArrow.alpha = 0
        risk4IndicatorArrow.alpha = 0
        risk5IndicatorArrow.alpha = 0
        switch riskIndex {
        case 1:
            risk1heightConstraint.constant = riskSelectedHeight
            risk1IndicatorArrow.alpha = 1
        case 2:
            risk2heightConstraint.constant = riskSelectedHeight
            risk2IndicatorArrow.alpha = 1
        case 3:
            risk3heightConstraint.constant = riskSelectedHeight
            risk3IndicatorArrow.alpha = 1
        case 4:
            risk4heightConstraint.constant = riskSelectedHeight
            risk4IndicatorArrow.alpha = 1
        case 5:
            risk5heightConstraint.constant = riskSelectedHeight
            risk5IndicatorArrow.alpha = 1
        default: break
        }
        
        
        // FundInfo
        for view in infoStackView.subviews {
            infoStackView.removeArrangedSubview(view)
        }
        createFundInfoRow(title: "", data1: "Fundo", data2: "CDI", isHeader: true)
        createFundInfoRow(title: "No mês", data1: monthInfo.0, data2: monthInfo.1)
        createFundInfoRow(title: "No ano", data1: yearInfo.0, data2: yearInfo.1)
        createFundInfoRow(title: "12 meses", data1: twelveMonths.0, data2: twelveMonths.1)
    }
    
    
    private func createFundInfoRow(title: String, data1: String, data2: String, isHeader: Bool = false) {
        let theme = ThemeManager.current()
        // labels
        let titleLabel = UILabel()
        let column1Label = UILabel()
        let column2Label = UILabel()
        titleLabel.textColor = theme.fundSecondaryTextColor
        column1Label.textColor = isHeader ? theme.fundSecondaryTextColor : theme.fundPrimaryTextColor
        column2Label.textColor = isHeader ? theme.fundSecondaryTextColor : theme.fundPrimaryTextColor
        titleLabel.font = theme.fundInfoFont
        column1Label.font = theme.fundInfoFont
        column2Label.font = theme.fundInfoFont
        column1Label.textAlignment = .right
        column2Label.textAlignment = .right
        titleLabel.text = title
        column1Label.text = data1
        column2Label.text = data2
        // stack view
        let fundInfoRow = UIStackView(arrangedSubviews: [titleLabel, column1Label, column2Label])
        fundInfoRow.axis = .horizontal
        fundInfoRow.alignment = .fill
        fundInfoRow.distribution = .fillEqually
        fundInfoRow.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        infoStackView.addArrangedSubview(fundInfoRow)
    }
}
