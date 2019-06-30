//
//  InvestmentStaticInfoTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class InvestmentStaticInfoTableViewCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitleLabel: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var monthCdiLabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var yearCdiLabel: UILabel!
    @IBOutlet weak var monthsFundLabel: UILabel!
    @IBOutlet weak var monthsCdiLabel: UILabel!
    
    @IBOutlet weak var riskView: UIStackView!
    
    @IBOutlet weak var riskStackView: UIStackView!
    @IBOutlet weak var moreInfoStackView: UIStackView!
    @IBOutlet weak var monthStackView: UIStackView!
    @IBOutlet weak var yearStackView: UIStackView!
    @IBOutlet weak var monthsStackView: UIStackView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func applyContent(_ model: InvestmentScreen)
    {
        titleLabel.text = model.screen?.title ?? "-"
        fundNameLabel.text = model.screen?.fundName ?? "-"
        whatIsLabel.text = model.screen?.whatIs ?? "-"
        definitionLabel.text = model.screen?.definition ?? "-"
        riskTitleLabel.text = model.screen?.riskTitle ?? "-"
        infoTitleLabel.text = model.screen?.infoTitle ?? "-"
        
        // esconde a UI caso não venha dados
        moreInfoStackView.isHidden = model.screen?.moreInfo == nil
        monthStackView.isHidden = model.screen?.moreInfo?.month == nil
        yearStackView.isHidden = model.screen?.moreInfo?.year == nil
        monthsStackView.isHidden = model.screen?.moreInfo?.months == nil
        
        monthFundLabel.text = model.screen?.moreInfo?.month?.fund?.asPercent ?? "-"
        monthCdiLabel.text = model.screen?.moreInfo?.month?.cdi?.asPercent ?? "-"
        yearFundLabel.text = model.screen?.moreInfo?.year?.fund?.asPercent ?? "-"
        yearCdiLabel.text = model.screen?.moreInfo?.year?.cdi?.asPercent ?? "-"
        monthsFundLabel.text = model.screen?.moreInfo?.months?.fund?.asPercent ?? "-"
        monthsCdiLabel.text = model.screen?.moreInfo?.months?.cdi?.asPercent ?? "-"
        
        if let risk = model.screen?.risk, risk >= 1 && risk <= 5
        {
            riskStackView.isHidden = false
            
            let position = riskView.subviews[Int(risk) - 1]
            
            let imageView = position.subviews.first(where: {$0 is UIImageView}) as? UIImageView
            
            imageView?.image = #imageLiteral(resourceName: "expand_arrow")
        }
        else
        {
            riskStackView.isHidden = true
        }
    }
}
