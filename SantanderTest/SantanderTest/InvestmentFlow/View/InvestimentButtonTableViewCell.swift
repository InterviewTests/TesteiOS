//
//  InvestimentButtonTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

protocol InvestimentButtonCellDelegate: NSObjectProtocol
{
    func onInvest()
}

class InvestimentButtonTableViewCell: UITableViewCell
{
    @IBOutlet weak var investButton: UIButton!
    
    weak var delegate: InvestimentButtonCellDelegate?
    
    @IBAction func investAction()
    {
        delegate?.onInvest()
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        investButton.layer.cornerRadius = 23
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
