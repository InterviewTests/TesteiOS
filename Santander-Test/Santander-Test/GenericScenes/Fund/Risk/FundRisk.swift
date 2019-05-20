//
//  FundRisk.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 16/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class FundRisk: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var lightGreenView: UIView!
    @IBOutlet weak var darkGreenView: UIView!
    @IBOutlet weak var darkYellowView: UIView!
    @IBOutlet weak var darkOrangeView: UIView!
    @IBOutlet weak var darkRedView: UIView!
    
    @IBOutlet weak var riskPointer: UIImageView!
    @IBOutlet weak var riskPointerCenterConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "FundRisk"
    
    var viewModel: FundRisk.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        label.textColor = UIColor.getColorDarkGray
        lightGreenView.backgroundColor = UIColor.getColorRiskLightGreen
        darkGreenView.backgroundColor = UIColor.getColorRiskDarkGreen
        darkYellowView.backgroundColor = UIColor.getColorRiskDarkYellow
        darkOrangeView.backgroundColor = UIColor.getColorRiskDarkOrange
        darkRedView.backgroundColor = UIColor.getColorRiskDarkRed
        lightGreenView.roundCorners(corners: [.bottomLeft, .topLeft], radius: 3.0)
        darkRedView.roundCorners(corners: [.bottomRight, .topRight], radius: 3.0)
    }
    
    private func didSetViewModel() {
        
        selectRiskView()
    }
    
    private func selectRiskView() {
        guard
            let viewModelRisk = viewModel?.risk,
            1...5 ~= viewModelRisk
            else { return }
        
        switch viewModelRisk {
        case 1:
            highlightRiskView(riskView: lightGreenView)
            setupRiskPointer(aboveRiskView: lightGreenView)
        case 2:
            highlightRiskView(riskView: darkGreenView)
            setupRiskPointer(aboveRiskView: darkGreenView)
        case 3:
            highlightRiskView(riskView: darkYellowView)
            setupRiskPointer(aboveRiskView: darkYellowView)
        case 4:
            highlightRiskView(riskView: darkOrangeView)
            setupRiskPointer(aboveRiskView: darkOrangeView)
        case 5:
            highlightRiskView(riskView: darkRedView)
            setupRiskPointer(aboveRiskView: darkRedView)
        default:
            return
        }
        
    }
    
    private func highlightRiskView(riskView: UIView) {
        riskView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = 10
            }
        }
    }
    
    private func setupRiskPointer(aboveRiskView riskView: UIView) {
        riskPointerCenterConstraint.constant = riskView.frame.midX - darkYellowView.frame.midX
    }
}

extension FundRisk {
    struct ViewModel {
        let risk: Int?
    }
}
