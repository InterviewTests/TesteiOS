//
//  TextViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 18/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons
import Domain

class TextViewCell: UITableViewCell, FormViewCell {
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType) -> (Bool), hidden: Bool, topSpacing: Double) {
        label.text = message
        
        label.isHidden = hidden
        
        topConstraint.constant = CGFloat(topSpacing)
    }
    
    
    
}
