//
//  ButtonCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

typealias ButtonPressedCompletion = (CellMetaData) -> Void

class ButtonCell: BaseCell {
    
    @IBOutlet var button: CustomButton!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    static let identifier:String = "ButtonCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "ButtonCell", bundle: nil)
        return nibInfo
    }
    var selectionCompletion:ButtonPressedCompletion?
    
    func populate(cellMetaData:CellMetaData){
        self.cellMetaData = cellMetaData
        
        if let cell = cellMetaData.cell{
            if let topSpacing = cell.topSpacing{
                topConstraint.constant = CGFloat(topSpacing)
            }
            if let message = cell.message{
                button.setTitle(message, for: UIControlState.normal)
            }
        }
        self.selectionStyle = .none
    }
    
    @IBAction func action(_ sender: Any) {
        selectionCompletion?(cellMetaData)
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
