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
    
    private var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outCheckView.layer.cornerRadius = outCheckView.frame.height / 7.5
        inCheckView.layer.cornerRadius = inCheckView.frame.height / 7.5
        checkButton.layer.cornerRadius = checkButton.frame.height / 7.5
    }
    
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType) -> (Bool), hidden: Bool, topSpacing: Double) {
        label.text = message
        label.isHidden = hidden
        checkButton.isHidden = hidden
        outCheckView.isHidden = hidden
        
        isChecked = true
        checkButtonPressed(self)
        
        topConstraint.constant = CGFloat(topSpacing)
    }
    
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        isChecked = !isChecked
        checkButton.backgroundColor = self.isChecked ? UIColor.red : UIColor.white
    }

    
}
