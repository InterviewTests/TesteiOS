//
//  CheckboxCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class CheckboxCell: UITableViewCell {
    
    @IBOutlet weak var checkboxOuterView: CheckBox!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "CheckboxCell"
    
    var viewModel: CheckboxCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
        setupCheckboxDelegate()
    }
    
    private func configureLayout() {
        label.textColor = UIColor.getColorDarkGray
    }
    
    private func setupCheckboxDelegate() {
        checkboxOuterView.delegate = self
    }
    
    private func didSetViewModel() {
        checkboxOuterView.isChecked = true
        guard let viewModel = viewModel else { return }
        label.text = viewModel.message ?? "-"
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
    }
}

extension CheckboxCell: CheckBoxDelegate {
    func valueDidChange(value: Bool) {
        print("dscsd")
    }
    
}

extension CheckboxCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
    }
}
