//
//  MoreInfo.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 17/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class FundMoreInfoCell: UITableViewCell {
    
    @IBOutlet weak var moreInfoTitleLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var twelveMonthsLabel: UILabel!
    
    @IBOutlet weak var FundLabel: UILabel!
    @IBOutlet weak var cdiLabel: UILabel!
    
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var twelveMonthsFundLabel: UILabel!
    @IBOutlet weak var monthCdiLabel: UILabel!
    @IBOutlet weak var yearCdiLabel: UILabel!
    @IBOutlet weak var twelveMonthsCdiLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    static let reuseIdentifier = "FundMoreInfoCell"
    
    var viewModel: FundMoreInfoCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        moreInfoTitleLabel.textColor = UIColor.getColorDarkGray
        monthLabel.textColor = UIColor.getColorDarkGray
        yearLabel.textColor = UIColor.getColorDarkGray
        twelveMonthsLabel.textColor = UIColor.getColorDarkGray
        FundLabel.textColor = UIColor.getColorDarkGray
        cdiLabel.textColor = UIColor.getColorDarkGray
        lineView.backgroundColor = UIColor.getColorLightGray
    }
    
    private func didSetViewModel() {
        guard let fundMoreInfo = viewModel?.fundMoreInfo else { return }
        
        let monthFund: String = {
            guard
                let monthFund = fundMoreInfo.month?.fund,
                let monthFundFormatted = monthFund.getBrazilianPercentFormat() else {
                return "-"
            }
            return monthFundFormatted
        }()
        
        let yearFund: String = {
            guard
                let yearFund = fundMoreInfo.year?.fund,
                let yearFundFormatted = yearFund.getBrazilianPercentFormat() else {
                return "-"
            }
            return yearFundFormatted
        }()
        
        let twelveMonthsFund: String = {
            guard
                let twelveMonthsFund = fundMoreInfo.twelveMonths?.fund,
                let twelveMonthsFundFormatted = twelveMonthsFund.getBrazilianPercentFormat() else {
                return "-"
            }
            return twelveMonthsFundFormatted
        }()
        
        let monthCdi: String = {
            guard
                let monthCdi = fundMoreInfo.month?.CDI,
                let monthCdiFormatted = monthCdi.getBrazilianPercentFormat() else {
                return "-"
            }
            return monthCdiFormatted
        }()
        
        let yearCdi: String = {
            guard
                let yearCdi = fundMoreInfo.year?.CDI,
                let yearCdiFormatted = yearCdi.getBrazilianPercentFormat() else {
                return "-"
            }
            return yearCdiFormatted
        }()
        
        let twelveMonthsCdi: String = {
            guard
                let twelveMonthsCdi = fundMoreInfo.twelveMonths?.CDI,
                let twelveMonthsCdiFormatted = twelveMonthsCdi.getBrazilianPercentFormat() else {
                return "-"
            }
            return twelveMonthsCdiFormatted
        }()
        
        monthFundLabel.text = monthFund
        yearFundLabel.text = yearFund
        twelveMonthsFundLabel.text = twelveMonthsFund
        monthCdiLabel.text = monthCdi
        yearCdiLabel.text = yearCdi
        twelveMonthsCdiLabel.text = twelveMonthsCdi
    }
}

extension FundMoreInfoCell {
    struct ViewModel {
        let fundMoreInfo: FundMoreInfo?
    }
}
