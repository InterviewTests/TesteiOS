//
//  InvestmentDownloadCell.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class InvestmentDownloadCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel?
    
    var onDownloadPressed: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func loadUI(_ fundInfo: FundInfo) {
        nameLabel?.text = fundInfo.name
    }
    
    @IBAction func download() {
        onDownloadPressed?()
    }
}
