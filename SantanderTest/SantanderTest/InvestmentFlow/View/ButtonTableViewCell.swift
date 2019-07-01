//
//  ButtonTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

protocol ButtonCellDelegate: NSObjectProtocol
{
    func onAction()
}

class ButtonTableViewCell: UITableViewCell
{
    @IBOutlet weak var actionButton: UIButton!
    
    weak var delegate: ButtonCellDelegate?
    
    @IBAction func buttonAction()
    {
        delegate?.onAction()
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        actionButton.layer.cornerRadius = 23
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func applyContent(text: String?)
    {
        actionButton.setTitle(text ?? "-", for: .normal)
    }
}
