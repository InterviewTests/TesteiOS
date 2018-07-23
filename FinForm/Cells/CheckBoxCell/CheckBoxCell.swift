//
//  CheckBoxCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

typealias CheckBoxSelectionCompletion = (Bool,CellMetaData) -> Void

class CheckBoxCell: UITableViewCell {
    
    @IBOutlet var boxView: UIView!
    @IBOutlet var boxButton: UIButton!
    @IBOutlet var boxLabel: UILabel!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    var cellMetaData:CellMetaData!
    static let identifier:String = "CheckBoxCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "CheckBoxCell", bundle: nil)
        return nibInfo
    }
    
    var selectionCompletion:CheckBoxSelectionCompletion?
    
    func populate(cellMetaData:CellMetaData){
        self.cellMetaData = cellMetaData
        
        if let cell = cellMetaData.cell{
            if let topSpacing = cell.topSpacing{
                topConstraint.constant = CGFloat(topSpacing)
            }
            if let message = cell.message{
                boxLabel.text = message
            }
        }
        
        boxView.layer.cornerRadius = 3
        boxView.layer.masksToBounds = true
        
        boxButton.layer.cornerRadius = 3
        boxButton.layer.masksToBounds = true
        boxButton.layer.borderColor = UIColor.white.cgColor
        boxButton.layer.borderWidth = 2.0
        
        if cellMetaData.selected{
            select()
        } else{
            deselect()
        }
    }
    
    @IBAction func selectAction(_ sender: Any) {
        if cellMetaData.selected{
            deselect()
            selectionCompletion?(false,cellMetaData)
        } else{
            select()
            selectionCompletion?(true,cellMetaData)
        }
        
    }
    
    func select(){
        cellMetaData.selected = true
        boxButton.backgroundColor = UIColor().customRed
    }
    
    func deselect(){
        cellMetaData.selected = false
        boxButton.backgroundColor = UIColor.white
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
