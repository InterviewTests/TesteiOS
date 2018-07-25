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
    
    @IBOutlet var button: UIButton!
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
        
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(pressedAnimation), for: UIControlEvents.touchDown)
        button.addTarget(self, action: #selector(unpressedAnimation), for: UIControlEvents.touchUpInside)
        button.addTarget(self, action: #selector(unpressedAnimation), for: UIControlEvents.touchUpOutside)
    }
    
    @IBAction func action(_ sender: Any) {
        selectionCompletion?(cellMetaData)
    }
    
    @objc private func pressedAnimation(){
        UIView.animate(withDuration: 0.2) {
            self.button.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            self.button.alpha = 0.5
        }
    }
    
    @objc private func unpressedAnimation(){
        UIView.animate(withDuration: 0.2) {
            self.button.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.button.alpha = 1
        }
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
