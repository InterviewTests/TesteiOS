//
//  CheckboxTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell, CellProtocol {
    var cell: Cell?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    var controller: FormViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.isUserInteractionEnabled = false
        setCheckBoxState(to: CheckboxTableViewCell.lastState)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup() {
        clipsToBounds = true
        guard let cell = cell else {
            return
        }
        label.text = cell.message
        topSpacing?.constant = CGFloat(cell.topSpacing)
    }
    fileprivate static var lastState = false
    
    private func setCheckBoxState(to state: Bool){
        CheckboxTableViewCell.lastState = state
        checkbox.isSelected = state
        
        if let id = cell?.show, let controller = self.controller{
            controller.showCell(state, withId: id)
        }
    }
    
    @IBAction func checboxClicked() {
       setCheckBoxState(to: !checkbox.isSelected)
    }
}
