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
        moreInfoTitleLabel.textColor = UIColor.darkGrayColor
        monthLabel.textColor = UIColor.darkGrayColor
        yearLabel.textColor = UIColor.darkGrayColor
        twelveMonthsLabel.textColor = UIColor.darkGrayColor
        FundLabel.textColor = UIColor.darkGrayColor
        cdiLabel.textColor = UIColor.darkGrayColor
        lineView.backgroundColor = UIColor.lightGrayColor
    }
    
    private func didSetViewModel() {
        guard let fundMoreInfo = viewModel?.fundMoreInfo else { return }
        
        let monthFund: String = {
            guard let monthFund = fundMoreInfo.month?.fund else {
                return "-"
            }
            return String(monthFund)
        }()
        
        let yearFund: String = {
            guard let yearFund = fundMoreInfo.year?.fund else {
                return "-"
            }
            return String(yearFund)
        }()
        
        let twelveMonthsFund: String = {
            guard let twelveMonthsFund = fundMoreInfo.twelveMonths?.fund else {
                return "-"
            }
            return String(twelveMonthsFund)
        }()
        
        let monthCdi: String = {
            guard let monthCdi = fundMoreInfo.month?.CDI else {
                return "-"
            }
            return String(monthCdi)
        }()
        
        let yearCdi: String = {
            guard let yearCdi = fundMoreInfo.year?.CDI else {
                return "-"
            }
            return String(yearCdi)
        }()
        
        let twelveMonthsCdi: String = {
            guard let twelveMonthsCdi = fundMoreInfo.twelveMonths?.CDI else {
                return "-"
            }
            return String(twelveMonthsCdi)
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
        let fundMoreInfo: FundMoreInfo
    }
}
