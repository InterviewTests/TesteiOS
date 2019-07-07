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
    
    var checkBoxStatus: CheckBoxSelectionStatus = .unselected {
        didSet {
            setCheckBoxUI(status: self.checkBoxStatus)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        addGestures()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        checkBoxStatus = .unselected
    }
    
    private func setupLayout() {
        checkBoxContainerView.layer.cornerRadius = 3.0
        checkBoxContainerView.layer.borderWidth = 1.0
        checkBoxContainerView.layer.borderColor = UIColor(red: 92/255, green: 92/255, blue: 92/255, alpha: 1.0).cgColor
        
        checkBoxIndicatorView.layer.cornerRadius = 3.0
    }
    
    private func addGestures() {
        checkBoxTextLabel.isUserInteractionEnabled = true
        
        addGestureToToggleCheckBox(inView: checkBoxContainerView)
        addGestureToToggleCheckBox(inView: checkBoxIndicatorView)
        addGestureToToggleCheckBox(inView: checkBoxTextLabel)
    }
    
    private func addGestureToToggleCheckBox(inView view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleCheckbox))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func toggleCheckbox() {
        switch checkBoxStatus {
        case .selected:
            checkBoxStatus = .unselected
        case .unselected:
            checkBoxStatus = .selected
        }
    }
    
    func setCheckBoxUI(status: CheckBoxSelectionStatus) {
        switch status {
        case .selected:
            checkBoxIndicatorView.isHidden = false
        case .unselected:
            checkBoxIndicatorView.isHidden = true
        }
    }
}
