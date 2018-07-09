//
//  FormCheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 06/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {
    
    var isChecked: Bool = false

    @IBOutlet weak var checkboxButton: UIButton!
    @IBAction func checkboxClick(_ sender: UIButton) {
        isChecked = !isChecked
        
        if (isChecked) {
            checkboxButton.setImage(UIImage(named: "checkboxChecked"), for: UIControlState.normal)
        } else {
            checkboxButton.setImage(UIImage(named: "checkboxUnchecked"), for: UIControlState.normal)
        }
    }
    @IBOutlet weak var labelCheckbox: UILabel!
    
    var viewModel: Form.FormCell.ViewModel = Form.FormCell.ViewModel() {
        didSet {
            didSetViewModel()
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
    
    private func didSetViewModel() {
        configCell()
    }
    
    func configCell() {
        for constraint in self.contentView.constraints {
            if constraint.identifier == "constraintStackTop" {
                constraint.constant = CGFloat(viewModel.topSpacing)
            }
        }
        self.contentView.layoutIfNeeded()

        labelCheckbox.text = viewModel.message
    }
}
