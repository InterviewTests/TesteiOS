//
//  InvestmentHeaderCell.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class InvestmentHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var fundNameLabel: UILabel?
    @IBOutlet weak var whatIsLabel: UILabel?
    @IBOutlet weak var descriptionTextView: UITextView?
    @IBOutlet weak var fundRiskTitleLabel: UILabel?
    @IBOutlet weak var fundRiskProgressView: UIStackView?
    @IBOutlet weak var fundRiskProgressImage: UIImageView?
    @IBOutlet weak var fundRiskProgressImageCenterX: NSLayoutConstraint?
    @IBOutlet weak var moreInfoTitleLabel: UILabel?
    
    @IBOutlet weak var monthFundLabel: UILabel?
    @IBOutlet weak var monthDataLabel: UILabel?
    
    @IBOutlet weak var yearFundLabel: UILabel?
    @IBOutlet weak var yearDataLabel: UILabel?
    
    @IBOutlet weak var lastTwelveMonthsFundLabel: UILabel?
    @IBOutlet weak var lastTwelveMonthsDataLabel: UILabel?
    
    var riskValue: Int? {
        willSet {
            guard let risk = riskValue, let views = fundRiskProgressView?.arrangedSubviews,
                risk > 0, risk < views.count else { return }
            
            views[risk].transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        didSet {
            guard var risk = riskValue else { return }
            risk -= 1
            
            guard let views = fundRiskProgressView?.arrangedSubviews, risk >= 0, risk < views.count else { return }
            
            views[risk].transform = CGAffineTransform(scaleX: 1, y: 1.75)
            
            if let fundRiskProgressImage = fundRiskProgressImage {
                let viewDist = views[risk].frame.origin.x + (views[risk].frame.width/2)
                let imageDist = fundRiskProgressImage.frame.origin.x +
                    (fundRiskProgressImage.frame.width/2)
                fundRiskProgressImageCenterX?.constant += viewDist - imageDist
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        var colors: [UIColor] = []
        colors.append(UIColor(red: 116/255, green: 218/255, blue: 97/255, alpha: 1))
        colors.append(UIColor(red: 74/255, green: 193/255, blue: 108/255, alpha: 1))
        colors.append(UIColor(red: 255/255, green: 192/255, blue: 16/255, alpha: 1))
        colors.append(UIColor(red: 242/255, green: 107/255, blue: 41/255, alpha: 1))
        colors.append(UIColor(red: 255/255, green: 53/255, blue: 51/255, alpha: 1))

        setProgressBarWithColors(with: colors)
    }
    
    func setProgressBarWithColors(with colors: [UIColor]) {
        guard let fundRiskProgressView = fundRiskProgressView else { return }
        
        fundRiskProgressView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        
        colors.forEach({
            let view = UIView()
            view.backgroundColor = $0
            
            fundRiskProgressView.addArrangedSubview(view)
            
            if $0 == colors.first {
                view.clipsToBounds = true
                if #available(iOS 11.0, *) {
                    view.layer.cornerRadius = 2.5
                    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                }
            } else if $0 == colors.last {
                view.clipsToBounds = true
                if #available(iOS 11.0, *) {
                    view.layer.cornerRadius = 2.5
                    view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                }
            }
        })
    }
    
    func loadUI(_ fund: Fund) {
        titleLabel?.text = fund.title
        fundNameLabel?.text = fund.name
        whatIsLabel?.text = fund.whatIsTitle
        fundRiskTitleLabel?.text = fund.riskTitle
        moreInfoTitleLabel?.text = fund.moreInfoTitle
        
        monthFundLabel?.text = fund.moreInfo?.month?.fund?.description ?? "--"
        monthDataLabel?.text = fund.moreInfo?.month?.cdi?.description ?? "--"
        
        yearFundLabel?.text = fund.moreInfo?.year?.fund?.description ?? "--"
        yearDataLabel?.text = fund.moreInfo?.year?.cdi?.description ?? "--"
        
        lastTwelveMonthsFundLabel?.text = fund.moreInfo?.twelveMonths?.fund?.description ?? "--"
        lastTwelveMonthsDataLabel?.text = fund.moreInfo?.twelveMonths?.cdi?.description ?? "--"
        
        descriptionTextView?.text = fund.description
        descriptionTextView?.sizeToFit()
        
        riskValue = fund.risk
        
        superview?.layoutIfNeeded()
    }
}
