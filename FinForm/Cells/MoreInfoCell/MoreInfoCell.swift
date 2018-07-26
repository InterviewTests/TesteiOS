//
//  MoreInfoCell.swift
//  FinForm
//
//  Created by Gustavo on 26/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class MoreInfoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundLabel: UILabel!
    @IBOutlet weak var cdiLabel: UILabel!
    
    static let identifier:String = "MoreInfoCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "MoreInfoCell", bundle: nil)
        return nibInfo
    }
    
    static let height:CGFloat = 42.0
    
    func populate(title:String,moreInfo:ScreenMoreInfo){
        titleLabel.text = title
        if let fund = moreInfo.fund,let cdi = moreInfo.CDI{
            fundLabel.text = "\(fund)%"
            cdiLabel.text = "\(cdi)%"
        }
        self.selectionStyle = .none
    }
    
    func populate(fundTitle:String,cdiTitle:String){
        titleLabel.text = ""
        fundLabel.text = fundTitle
        cdiLabel.text = cdiTitle
        if let dinProRegularFont = UIFont.dinProRegular{
            fundLabel.font = dinProRegularFont
            cdiLabel.font = dinProRegularFont
        }
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
