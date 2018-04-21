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
    var checkBoxChanged: ((Bool)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.isUserInteractionEnabled = false
        
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
        
        setCheckBoxState(to: lastState as? Bool)
    }
    
    
    private func setCheckBoxState(to state: Bool?){
        guard let state = state else{
            return
        }
        
        checkbox.isSelected = state
        lastState = state
    }
    
    var lastState: Any?{
        set{
            UserDefaults().set(newValue, forKey: uniqueKey)
        }
        get{
            return UserDefaults().value(forKey: uniqueKey) ?? false
        }
    }
    
    @IBAction func checboxClicked() {
        setCheckBoxState(to: !checkbox.isSelected)
        checkBoxChanged?(checkbox.isSelected)
    }
    
    var uniqueKey: String{
        return "CheckBox\(cell?.id ?? 0)"
    }
    
}
