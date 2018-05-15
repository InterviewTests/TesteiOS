//
//  InvestimentTableViewCell.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit

class InvestimentTableViewCell: UITableViewCell
{
    //Outlets
    @IBOutlet weak var labelInvestment: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelFundName: UILabel!
    @IBOutlet weak var labelWhatIs: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelRiskTitle: UILabel!
    //
    @IBOutlet weak var stackRisk: UIStackView!
    //
    @IBOutlet weak var imageArrowGreen: UIImageView!
    @IBOutlet weak var imageArrowDarkGreen: UIImageView!
    @IBOutlet weak var imageArrowYellow: UIImageView!
    @IBOutlet weak var imageArrowOrange: UIImageView!
    @IBOutlet weak var imageArrowRed: UIImageView!
    //
    @IBOutlet weak var heightViewGreen: NSLayoutConstraint!
    @IBOutlet weak var heightViewDarkGreen: NSLayoutConstraint!
    @IBOutlet weak var heightViewYellow: NSLayoutConstraint!
    @IBOutlet weak var heightViewOrange: NSLayoutConstraint!
    @IBOutlet weak var heightViewRed: NSLayoutConstraint!
    //
    @IBOutlet weak var labelInfoTitle: UILabel!
    //
    @IBOutlet weak var labelMonthCDI: UILabel!
    @IBOutlet weak var labelMonthFund: UILabel!
    @IBOutlet weak var labelYearCDI: UILabel!
    @IBOutlet weak var labelYearFund: UILabel!
    @IBOutlet weak var label12MonthsCDI: UILabel!
    @IBOutlet weak var label12MonthsFund: UILabel!
    //
    @IBOutlet weak var labelAdministrationFee: UILabel!
    @IBOutlet weak var labelAdministrationsData: UILabel!
    //
    @IBOutlet weak var labelInitialAplication: UILabel!
    @IBOutlet weak var labelAplicationData: UILabel!
    //
    @IBOutlet weak var labelMinimumTransition: UILabel!
    @IBOutlet weak var labelTrasitionData: UILabel!
    //
    @IBOutlet weak var labelMinimumBalance: UILabel!
    @IBOutlet weak var balanceData: UILabel!
    //
    @IBOutlet weak var labelRedeem: UILabel!
    @IBOutlet weak var labelRedeemData: UILabel!
    //
    @IBOutlet weak var labelQuota: UILabel!
    @IBOutlet weak var labelQuotaData: UILabel!
    //
    @IBOutlet weak var labelPayment: UILabel!
    @IBOutlet weak var labelPaymentData: UILabel!
    //
    @IBOutlet weak var labelEssential: UILabel!
    @IBOutlet weak var labelPerformance: UILabel!
    @IBOutlet weak var labelComplamentary: UILabel!
    @IBOutlet weak var labelRegulation: UILabel!
    @IBOutlet weak var labelMembership: UILabel!
   //
    @IBOutlet var buttonsDownload: [UIButton]!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        self.stackRisk.layer.cornerRadius = 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pointInvestmentRisk(_ risck: Int)
    {
        switch risck
        {
            case 1:
                hideArror(true)
                self.imageArrowGreen.isHidden = false
            case 2:
                hideArror(true)
                self.imageArrowDarkGreen.isHidden = false
            case 3:
                hideArror(true)
                self.imageArrowYellow.isHidden = false
            case 4:
                hideArror(true)
                self.imageArrowOrange.isHidden = false
            default:
                hideArror(true)
                self.imageArrowRed.isHidden = false
        }
    }
    
    func hideArror(_ value: Bool)
    {
        self.imageArrowGreen.isHidden = value
        self.imageArrowDarkGreen.isHidden = value
        self.imageArrowYellow.isHidden = value
        self.imageArrowOrange.isHidden = value
        self.imageArrowRed.isHidden = value
    }
    
    
}
