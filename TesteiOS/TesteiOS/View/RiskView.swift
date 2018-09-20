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

    var riskViews = [UIView]()
    let colors = [#colorLiteral(red: 0.4549019608, green: 0.8549019608, blue: 0.3803921569, alpha: 1), #colorLiteral(red: 0.2901960784, green: 0.7568627451, blue: 0.4235294118, alpha: 1), #colorLiteral(red: 1, green: 0.7529411765, blue: 0.06666666667, alpha: 1), #colorLiteral(red: 1, green: 0.4549019608, blue: 0.1725490196, alpha: 1), #colorLiteral(red: 1, green: 0.2117647059, blue: 0.2039215686, alpha: 1)]
    
    let size: CGFloat = 5
    let indicatorWidth: CGFloat = 12
    let indicatorMargin: CGFloat = 18
    let distance: CGFloat = 1
    let margin: CGFloat = 8
    
    lazy var indicatorImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.image = UIImage(named: "indicator")
        
        return view
    }()
    
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
        
        for i in 0 ..< Int(size) {
            let x = (i == 0 ? CGFloat(i) : riskViews[i - 1].frame.maxX + distance)
         
            let riskView = UIView(frame: CGRect(x: x, y: 0, width: UIScreen.main.bounds.width / size - distance - margin, height: self.frame.height))
            riskView.backgroundColor = colors[i]
            
            if i == 0 || i == Int(size) - 1 {
                let path = UIBezierPath(roundedRect: riskView.bounds,
                                        byRoundingCorners: (i == 0 ? [.topLeft, .bottomLeft] : [.topRight, .bottomRight]),
                                        cornerRadii: CGSize(width: riskView.frame.width / 2,
                                                            height: riskView.frame.width / 2))
                let maskLayer = CAShapeLayer()
                maskLayer.path = path.cgPath
                riskView.layer.mask = maskLayer
            }
            
            self.riskViews.append(riskView)
            self.addSubview(riskView)
        }
        
        setRisk(risk: riskLevel)
        
        self.addSubview(indicatorImageView)
    }
    
    func setRisk(risk: Int) {
        indicatorImageView.frame = CGRect(x: riskViews[risk - 1].frame.midX - indicatorWidth / 2, y: -indicatorMargin, width: indicatorWidth, height: 0.625 * indicatorWidth)
        
        for risk in riskViews {
            risk.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        riskViews[riskLevel - 1].transform = CGAffineTransform(scaleX: 1, y: 1.8)
        
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
