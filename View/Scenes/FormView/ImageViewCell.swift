//
//  ImageViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 18/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons
import Domain

class ImageViewCell: UITableViewCell, FormViewCell {
    
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType) -> (Bool), hidden: Bool, topSpacing: Double) {
        
        topConstraint.constant = CGFloat(topSpacing)
    }
    
    
    
}
