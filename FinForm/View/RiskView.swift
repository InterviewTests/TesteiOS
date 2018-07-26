//
//  RiskView.swift
//  FinForm
//
//  Created by Gustavo on 25/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class RiskView: UIView {

    @IBOutlet weak var fisrtBar:UIView!
    @IBOutlet weak var lastBar:UIView!
    
    @IBOutlet weak var fisrtBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fourthHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lastBarHeightConstraint: NSLayoutConstraint!
    
    private let defaultHeightConstraintValue:CGFloat = 8.0
    private let selectedHeightConstraintValue:CGFloat = 14.0
    
    func setRist(risk:Int)
    {
        resetHeightConstraints()
        
        switch risk {
        case 1:
            fisrtBarHeightConstraint.constant = selectedHeightConstraintValue
            configureFirstBar(factor: selectedHeightConstraintValue)
            configureLastBar(factor: defaultHeightConstraintValue)
        case 2:
            secondBarHeightConstraint.constant = selectedHeightConstraintValue
        case 3:
            thirdBarHeightConstraint.constant = selectedHeightConstraintValue
        case 4:
            fourthHeightConstraint.constant = selectedHeightConstraintValue
        case 5:
            lastBarHeightConstraint.constant = selectedHeightConstraintValue
            configureFirstBar(factor: defaultHeightConstraintValue)
            configureLastBar(factor: selectedHeightConstraintValue)
        default:
            break
        }
        
        self.layoutIfNeeded()
    }
    
    private func resetHeightConstraints()
    {
        fisrtBarHeightConstraint.constant = defaultHeightConstraintValue
        secondBarHeightConstraint.constant = defaultHeightConstraintValue
        thirdBarHeightConstraint.constant = defaultHeightConstraintValue
        fourthHeightConstraint.constant = defaultHeightConstraintValue
        lastBarHeightConstraint.constant = defaultHeightConstraintValue
    }
    
    private func configureFirstBar(factor:CGFloat)
    {
        fisrtBar.layer.cornerRadius = factor / 2
    }
    
    private func configureLastBar(factor:CGFloat)
    {
        lastBar.layer.cornerRadius = factor / 2
    }
    
    private func configure()
    {
        fisrtBar.layer.cornerRadius = fisrtBar.frame.height / 2
        fisrtBar.layer.masksToBounds = true
        
        lastBar.layer.cornerRadius = lastBar.frame.height / 2
        lastBar.layer.masksToBounds = true
        
        resetHeightConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
}
