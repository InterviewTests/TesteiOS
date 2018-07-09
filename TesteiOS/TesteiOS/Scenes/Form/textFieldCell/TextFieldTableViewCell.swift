//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 06/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTextField: UILabel!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var viewBottomLine: UIView!
    @IBOutlet weak var buttonClear: UIButton!
    @IBAction func buttonClearTouchUpInside(_ sender: UIButton) {
        textFieldInput.text = ""
    }
    
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
            if constraint.identifier == "constraintLabelTop" {
                constraint.constant = CGFloat(viewModel.topSpacing)
            }
        }
        self.contentView.layoutIfNeeded()
        
        labelTextField.text = viewModel.message
    }
}
