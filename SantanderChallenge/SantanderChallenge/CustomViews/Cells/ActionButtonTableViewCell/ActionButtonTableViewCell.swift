//
// ActionButtonTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

protocol ActionButtonTableViewCellDelegate: AnyObject {
    func didTouchActionButton(atCell cell: ActionButtonTableViewCell)
}

class ActionButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var actionButton: UIButton!
    
    weak var delegate: ActionButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupButtonLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTouchAt(_ button: UIButton) {
        delegate?.didTouchActionButton(atCell: self)
    }
    
    private func setupButtonLayout() {
        actionButton.layer.cornerRadius = actionButton.frame.height / 2.0
    }
}
