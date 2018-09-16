//
//  RiskView.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

@IBDesignable
class RiskView: UIView {

    var risks = [UIView]()
    var indicatorImageView: UIImageView!
    let indicatorWidth: CGFloat = 12
    let indicatorMargin: CGFloat = 18
    let distance: CGFloat = 1
    
    @IBInspectable var riskLevel: Int = 1 {
        didSet {
            setRisk(risk: riskLevel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    
    func updateView() {
        indicatorImageView = UIImageView(frame: CGRect.zero)
        indicatorImageView.image = UIImage(named: "indicator")
        
        let risk1 = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 5 - distance - 8, height: self.frame.height))
        risk1.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.8549019608, blue: 0.3803921569, alpha: 1)
        var path = UIBezierPath(roundedRect: risk1.bounds,
                                byRoundingCorners:[.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: risk1.frame.width / 2, height: risk1.frame.width / 2))
        var maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        risk1.layer.mask = maskLayer
        
        let risk2 = UIView(frame: CGRect(x: risk1.frame.maxX + distance, y: 0, width: UIScreen.main.bounds.width / 5 - distance - 8, height: self.frame.height))
        risk2.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.7568627451, blue: 0.4235294118, alpha: 1)
        
        let risk3 = UIView(frame: CGRect(x: risk2.frame.maxX + distance, y: 0, width: UIScreen.main.bounds.width / 5 - distance - 8, height: self.frame.height))
        risk3.backgroundColor = #colorLiteral(red: 1, green: 0.7529411765, blue: 0.06666666667, alpha: 1)
        
        let risk4 = UIView(frame: CGRect(x: risk3.frame.maxX + distance, y: 0, width: UIScreen.main.bounds.width / 5 - distance - 8, height: self.frame.height))
        risk4.backgroundColor = #colorLiteral(red: 1, green: 0.4549019608, blue: 0.1725490196, alpha: 1)
        
        let risk5 = UIView(frame: CGRect(x: risk4.frame.maxX + distance, y: 0, width: UIScreen.main.bounds.width / 5 - distance - 8, height: self.frame.height))
        risk5.backgroundColor = #colorLiteral(red: 1, green: 0.2117647059, blue: 0.2039215686, alpha: 1)
        path = UIBezierPath(roundedRect: risk5.bounds,
                                byRoundingCorners:[.topRight, .bottomRight],
                                cornerRadii: CGSize(width: risk5.frame.width / 2, height: risk5.frame.width / 2))
        maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        risk5.layer.mask = maskLayer
        
        self.risks.append(risk1)
        self.risks.append(risk2)
        self.risks.append(risk3)
        self.risks.append(risk4)
        self.risks.append(risk5)
        
        for risk in risks {
            self.addSubview(risk)
        }
        
        setRisk(risk: riskLevel)
        
        self.addSubview(indicatorImageView)
    }
    
    func setRisk(risk: Int) {
        indicatorImageView.frame = CGRect(x: risks[risk - 1].frame.midX - indicatorWidth / 2, y: -indicatorMargin, width: indicatorWidth, height: 0.625 * indicatorWidth)
        
        for risk in risks {
            risk.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        risks[riskLevel - 1].transform = CGAffineTransform(scaleX: 1, y: 1.8)
        
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
