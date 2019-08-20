//
//  CheckBoxViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 18/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons
import Domain

class CheckBoxViewCell: UITableViewCell, FormViewCell {
    
    
    @IBOutlet var outCheckView: UIView!
    @IBOutlet var inCheckView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    private var id: Int!
    private var isChecked = false
    
    private weak var buttonDelegate: FormViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outCheckView.layer.cornerRadius = outCheckView.frame.height / 7.5
        inCheckView.layer.cornerRadius = inCheckView.frame.height / 7.5
        checkButton.layer.cornerRadius = checkButton.frame.height / 7.5
    }
    
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, enabled: Bool, hidden: Bool, topSpacing: Double, delegate: FormViewCellDelegate?) {
        self.id = id
        label.text = message
        
        checkButton.isEnabled = enabled
        
        label.isHidden = hidden
        checkButton.isHidden = hidden
        outCheckView.isHidden = hidden
        
        isChecked = userInput as? Bool ?? false
        updateCheckedButton()
        
        topConstraint.constant = CGFloat(topSpacing)
        
        buttonDelegate = delegate
    }
    
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        isChecked = !isChecked
        updateCheckedButton()
        buttonDelegate?.saveUserInput(isChecked, id: id)
    }
    
    func updateCheckedButton() {
        checkButton.backgroundColor = self.isChecked ? ThemeManager.current().primaryColor : UIColor.white
    }
}
