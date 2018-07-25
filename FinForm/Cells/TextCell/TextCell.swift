//
//  TextCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class TextCell: BaseCell {
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!

    static let identifier:String = "TextCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "TextCell", bundle: nil)
        return nibInfo
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(cellMetaData:CellMetaData){
        self.cellMetaData = cellMetaData
        
        if let cell = cellMetaData.cell{
            if let topSpacing = cell.topSpacing{
                topConstraint.constant = CGFloat(topSpacing)
            }
            if let message = cell.message{
                titleLabel.text = message
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
