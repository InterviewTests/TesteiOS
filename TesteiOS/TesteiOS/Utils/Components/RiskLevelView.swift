//
//  RiskRateView.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

@IBDesignable
class RiskLevelView: UIView {
    
    @IBOutlet weak var ivArrow: UIImageView!
    @IBOutlet weak var lightGreenFactor: UIView!
    @IBOutlet weak var greenFactor: UIView!
    @IBOutlet weak var yellowFactor: UIView!
    @IBOutlet weak var orangeFactor: UIView!
    @IBOutlet weak var redFactor: UIView!
    
    @IBOutlet weak var constrRiskViewLeading: NSLayoutConstraint!
    @IBOutlet weak var constrLightGreenHeight: NSLayoutConstraint!
    @IBOutlet weak var constrGreenHeight: NSLayoutConstraint!
    @IBOutlet weak var constrYellowHeight: NSLayoutConstraint!
    @IBOutlet weak var constrOrangeHeight: NSLayoutConstraint!
    @IBOutlet weak var constrRedHeight: NSLayoutConstraint!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "RiskLevelView", bundle: bundle)
        
        let mainView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(mainView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lightGreenFactor.layer.cornerRadius = constrLightGreenHeight.constant/2
        redFactor.layer.cornerRadius = constrRedHeight.constant/2
    }

    func setRisk(_ level: Int) {
        let riskSize = self.frame.size.width / 5
        let step = (CGFloat(level) * riskSize) - riskSize/2
        constrRiskViewLeading.constant = step - ivArrow.frame.size.width/2
        
        switch level {
        case 1:
            constrLightGreenHeight.constant = 10
        case 2:
            constrGreenHeight.constant = 10
        case 3:
            constrYellowHeight.constant = 10
        case 4:
            constrOrangeHeight.constant = 10
        case 5:
            constrRedHeight.constant = 10
        default:
            break
        }
        
        layoutIfNeeded()
    }
}
