//
//  InvestmentDownInfoTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

protocol InvestmentDownInfoCellDelegate: NSObjectProtocol
{
    func onDownload()
}

class InvestmentDownInfoTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataButton: UIButton!
    
    weak var delegate: InvestmentDownInfoCellDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func downloadAction()
    {
        delegate?.onDownload()
    }
    
    func applyContent(name: String?, data: String?)
    {
        nameLabel.text = name ?? "-"
        dataButton.setTitle(data ?? "Baixar", for: .normal)
    }
}
