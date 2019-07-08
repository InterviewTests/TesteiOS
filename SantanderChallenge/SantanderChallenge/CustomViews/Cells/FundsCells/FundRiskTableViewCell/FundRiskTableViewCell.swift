//
// FundRiskTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class FundRiskTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var levelViews: [UIView]!
    @IBOutlet var levelsViewHeightConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var container: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(level: Int) {
        
        let index = level - 1
        
        let view = levelViews[index]
        let constraint = levelsViewHeightConstraints[index]
        constraint.constant = 10
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
        let gaps = CGFloat(index)
        
        let originX = container.frame.origin.x
        let jumps = gaps * view.frame.width
        let midView = view.frame.width / 2.0
        let total = originX + jumps + midView - gaps
        
        indicatorConstraint.constant = total
    }
}
