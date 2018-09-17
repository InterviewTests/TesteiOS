//
//  RiskBarView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/15/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class RiskBarView: UIView {
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var currentRiskChevron = UIImageView(image: #imageLiteral(resourceName: "glyph-chevron-down"))
    
    var currentRisk: Int = 0 {
        didSet {
            currentRiskChevron.isHidden = currentRisk == 0
            if (1...5).contains(currentRisk) {
                currentRiskChevron.isHidden = false
                let view = stackView.arrangedSubviews[currentRisk - 1]
                constraints.first(where: { constraint in constraint.identifier == "height\(currentRisk - 1)"})?.constant = 8
                constraints.first(where: { constraint in constraint.identifier == "height\(oldValue - 1)"})?.constant = 6
                if let constraint = currentRiskChevron.constraints.first (where: { constraint in constraint.identifier == "centerX" }) {
                    view.removeConstraint(constraint)
                }
                let constraint = currentRiskChevron.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                constraint.identifier = "centerX"
                addConstraint(constraint)
            } else {
                currentRiskChevron.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        currentRiskChevron.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        addSubview(currentRiskChevron)
        let height = stackView.heightAnchor.constraint(equalToConstant: 8)
        let leading = stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let topChevron = currentRiskChevron.topAnchor.constraint(equalTo: topAnchor)
        let centerXChevron = currentRiskChevron.centerXAnchor.constraint(equalTo: centerXAnchor)
        centerXChevron.priority = .defaultLow
        centerXChevron.identifier = "centerX"
        var constraints = [height, leading, trailing, bottom, topChevron, centerXChevron]
        let colors = [#colorLiteral(red: 0.4549019608, green: 0.8549019608, blue: 0.3803921569, alpha: 1), #colorLiteral(red: 0.2901960784, green: 0.7568627451, blue: 0.4235294118, alpha: 1), #colorLiteral(red: 1, green: 0.7529411765, blue: 0.06666666667, alpha: 1), #colorLiteral(red: 1, green: 0.4549019608, blue: 0.1725490196, alpha: 1), #colorLiteral(red: 1, green: 0.2117647059, blue: 0.2039215686, alpha: 1)]
        colors.enumerated().forEach { index, color in
            let view = levelView(with: color)
            let constraint = view.heightAnchor.constraint(equalToConstant: 6)
            constraint.identifier = "height\(index)"
            stackView.addArrangedSubview(view)
            constraints.append(constraint)
        }
        addConstraints(constraints)
    }
    
    private func levelView(with color: UIColor) -> UIView {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 6)))
        view.backgroundColor = color
        return view
    }
    
}
