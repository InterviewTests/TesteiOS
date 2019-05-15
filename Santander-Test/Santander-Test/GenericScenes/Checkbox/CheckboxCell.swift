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
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        label.text = viewModel.message ?? "-"
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
    }
}

extension CheckboxCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
    }
}
