//
//  FundosDetailsInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FundosDetailsInfoTableViewCell: UITableViewCell, FundosDetailsDefaultCellProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var delegate: FundosDetailsDefaultCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //    MARK: - Set
    func setInfo(info: FundosDetails.GetFund.ViewModel.DisplayedFundInfo) {
        nameLabel.text = info.name
        dataLabel.text = info.data
    }
}
