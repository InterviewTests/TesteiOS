//
//  InvestmentRiskCollectionViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class InvestmentRiskCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var riskColorView: UIView!
  @IBOutlet weak var arrowImage: UIImageView!
  
  var viewModel: ViewModel = ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    setupRiskView(type: viewModel.cellType)
  }
  
  func didSetViewModel() {
    riskColorView.backgroundColor = viewModel.color
    arrowImage.isHidden = !viewModel.isSelected
  }
  
  private func setupRiskView(type: CellType) {
    var path: UIBezierPath = UIBezierPath()
    
    switch type {
    case .first:
      path = UIBezierPath(roundedRect:riskColorView.bounds,
                              byRoundingCorners:[.topLeft, .bottomLeft],
                              cornerRadii: CGSize(width: 2.5, height:  2.5))

    case .last:
      path = UIBezierPath(roundedRect:riskColorView.bounds,
                          byRoundingCorners:[.topRight, .bottomRight],
                          cornerRadii: CGSize(width: 2.5, height:  2.5))
    default:
      return
    }
    
    
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    riskColorView.layer.mask = maskLayer
 
  }
}

extension InvestmentRiskCollectionViewCell {
  
  enum CellType {
    case normal
    case first
    case last
  }
  
  struct ViewModel {
    var color: UIColor = .green
    var isSelected: Bool = false
    var cellType: CellType = .normal
  }
}
