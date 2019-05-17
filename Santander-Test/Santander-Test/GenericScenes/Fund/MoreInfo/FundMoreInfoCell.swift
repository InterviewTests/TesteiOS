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
    @IBOutlet weak var cdLabel: UILabel!
    
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var twelveMonthsFundLabel: UILabel!
    @IBOutlet weak var monthCdLabel: UILabel!
    @IBOutlet weak var yearCdLabel: UILabel!
    @IBOutlet weak var twelveMonthsCdLabel: UILabel!
    
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
        cdLabel.textColor = UIColor.darkGrayColor
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        
    }
}

extension FundMoreInfoCell {
    struct ViewModel {
        
    }
}
