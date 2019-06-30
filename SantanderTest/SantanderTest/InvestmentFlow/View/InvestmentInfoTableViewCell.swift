//
//  InvestmentInfoTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class InvestmentInfoTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

    func applyContent(name: String?, data: String?)
    {
        nameLabel.text = name ?? "-"
        dataLabel.text = data ?? "-"
    }
}
