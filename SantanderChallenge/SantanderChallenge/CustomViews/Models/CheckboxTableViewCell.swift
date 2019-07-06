//
// CheckboxTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

enum CheckBoxSelectionStatus {
    case selected
    case unselected
}

class CheckboxTableViewCell: UITableViewCell {
    @IBOutlet weak var checkBoxContainerView: UIView!
    @IBOutlet weak var checkBoxIndicatorView: UIView!
    @IBOutlet weak var checkBoxTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        setCheckBoxSelection(status: .unselected)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupLayout() {
        checkBoxContainerView.layer.cornerRadius = 3.0
        checkBoxContainerView.layer.borderWidth = 1.0
        checkBoxContainerView.layer.borderColor = UIColor(red: 92/255, green: 92/255, blue: 92/255, alpha: 1.0).cgColor
        
        checkBoxIndicatorView.layer.cornerRadius = 3.0
    }
    
    func setCheckBoxSelection(status: CheckBoxSelectionStatus) {
        switch status {
        case .selected:
            checkBoxIndicatorView.isHidden = true
        case .unselected:
            checkBoxIndicatorView.isHidden = false
        }
    }
}
