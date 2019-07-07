//
// FundMoreInfoTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class FundMoreInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var monthCDILabel: UILabel!
    
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var yearCDILabel: UILabel!
    
    @IBOutlet weak var twelveMonthsFundLabel: UILabel!
    @IBOutlet weak var twelveMonthCDILabel: UILabel!
    
    var dataSource: FundMoreInfo? {
        didSet {
            setLabels()
        }
    }
    
    private func setLabels() {
        monthFundLabel.text = dataSource?.month.fundPresentable
        monthCDILabel.text = dataSource?.month.cdiPresentable
        
        yearFundLabel.text = dataSource?.year.fundPresentable
        yearCDILabel.text = dataSource?.year.cdiPresentable
        
        twelveMonthsFundLabel.text = dataSource?.twelveMonths.fundPresentable
        twelveMonthCDILabel.text = dataSource?.twelveMonths.cdiPresentable
    }
}
