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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutBorders()
    }
    
    func set(level: Int) {
        let view = levelViews[level]
        let position = view.frame.origin
        let size = CGSize(width: view.frame.width, height: 10)
        UIView.animate(withDuration: 0.3) {
            view.frame = CGRect(origin: position, size: size)
        }
        
        indicatorConstraint.constant = view.frame.midX
    }
    
    private func layoutBorders() {
        guard let first = levelViews.first, let last = levelViews.last else { return }
        
        let radius: CGFloat = first.frame.height / 2.0
        first.roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
        last.roundCorners(corners: [.topRight, .bottomRight], radius: radius)
    }
}
