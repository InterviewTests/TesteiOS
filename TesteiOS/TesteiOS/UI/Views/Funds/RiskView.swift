//
//  RiskView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class RiskView: UIView {
  
  @IBOutlet weak var fisrtBar: UIView!
  @IBOutlet weak var lastBar: UIView!
  
  @IBOutlet weak var fisrtBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var secondBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var thirdBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var fourthHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var lastBarHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var vImageViewLeadingConstraint: NSLayoutConstraint!
  
  private let defaultHeightConstraintValue: CGFloat = 6.0
  private let selectedHeightConstraintValue: CGFloat = 10.0
  
  private var defaultVImageViewLeadingConstraintValue: CGFloat!
  
  func setRist(risk: Int) {
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
    
    configureVImageView(risk: risk)
    
    self.layoutIfNeeded()
  }
  
  private func configureVImageView(risk: Int) {
    let factor = (UIScreen.main.bounds.width - 70) / 5
    let value = defaultVImageViewLeadingConstraintValue + (CGFloat(risk - 1) * factor)
    vImageViewLeadingConstraint.constant = value
  }
  
  private func resetHeightConstraints() {
    fisrtBarHeightConstraint.constant = defaultHeightConstraintValue
    secondBarHeightConstraint.constant = defaultHeightConstraintValue
    thirdBarHeightConstraint.constant = defaultHeightConstraintValue
    fourthHeightConstraint.constant = defaultHeightConstraintValue
    lastBarHeightConstraint.constant = defaultHeightConstraintValue
  }
  
  private func configureFirstBar(factor: CGFloat) {
    fisrtBar.layer.cornerRadius = factor / 2
  }
  
  private func configureLastBar(factor: CGFloat) {
    lastBar.layer.cornerRadius = factor / 2
  }
  
  private func configure() {
    fisrtBar.layer.cornerRadius = fisrtBar.frame.height / 2
    fisrtBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    
    lastBar.layer.cornerRadius = lastBar.frame.height / 2
    lastBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    vImageViewLeadingConstraint.constant = ((UIScreen.main.bounds.width - 70) / 5) / 2
    defaultVImageViewLeadingConstraintValue = vImageViewLeadingConstraint.constant
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configure()
  }
}
