//
//  CheckBoxTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

protocol CheckBoxCellDelegate: NSObjectProtocol
{
    func onAction(isChecked: Bool, componentId: UInt8?)
}

class CheckBoxTableViewCell: UITableViewCell
{
    @IBOutlet weak var actionButton: UIButton!
    
    weak var delegate: CheckBoxCellDelegate?
    
    private var componentId: UInt8?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonAction()
    {
        actionButton.setImage(actionButton.currentImage == #imageLiteral(resourceName: "unchecked_checkbox") ? #imageLiteral(resourceName: "checked_checkbox") : #imageLiteral(resourceName: "unchecked_checkbox"), for: .normal)
        
        delegate?.onAction(isChecked: actionButton.currentImage != #imageLiteral(resourceName: "unchecked_checkbox"), componentId: componentId)
    }

    func applyContent(text: String?, id: UInt8? = nil)
    {
        actionButton.setTitle(text ?? "-", for: .normal)
        
        componentId = id
    }
}
