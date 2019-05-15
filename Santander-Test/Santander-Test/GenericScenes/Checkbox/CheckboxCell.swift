//
//  CheckboxCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class CheckboxCell: UITableViewCell {
    
    @IBOutlet weak var checkboxOuterView: UIView!
    @IBOutlet weak var checkboxInnerView: UIView!
    @IBOutlet weak var label: UILabel!
    
    static let reuseIdentifier = "CheckboxCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        checkboxOuterView.layer.borderColor = UIColor.lightGrayColor.cgColor
        checkboxOuterView.layer.borderWidth = 1
        checkboxOuterView.layer.cornerRadius = 3
        checkboxOuterView.backgroundColor = nil
        
        checkboxInnerView.backgroundColor = UIColor.darkRedColor
        checkboxInnerView.layer.cornerRadius = 2
        
        label.textColor = UIColor.lightGrayColor
    }
}
