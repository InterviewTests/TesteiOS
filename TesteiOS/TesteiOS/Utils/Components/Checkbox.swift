//
//  Checkbox.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class Checkbox: UIView {
    
    var isSelected: Bool = false {
        didSet {
            self.backgroundColor = isSelected ? UIColor.redError : UIColor.white
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(setSelected(_:)))
        self.addGestureRecognizer(tap)
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
    
    @objc func setSelected(_ sender: UITapGestureRecognizer) {
        self.isSelected = !self.isSelected
    }

}
