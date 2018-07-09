//
//  RiskMeter.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class RiskMeter: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var arrow: UIImageView!
    var arrowXConstraint: NSLayoutConstraint?
    
    var riskIndex: Int = 2 {
        didSet {
            displayRisk()
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @IBOutlet var bars: [UIView]!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("RiskMeter", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        setupBars()
        displayRisk()
    }
    
    func setupBars() {
        guard
            let firstBar = bars.first,
            let lastBar = bars.last
            else { return }
        
        firstBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        lastBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        [firstBar, lastBar].forEach { bar in
            bar.layer.cornerRadius = bar.frame.height / 2
        }
    }
    
    func displayRisk() {
        let bar = bars[riskIndex]

        arrowXConstraint?.isActive = false
        arrowXConstraint = arrow.centerXAnchor.constraint(equalTo: bar.centerXAnchor)
        arrowXConstraint?.isActive = true
        
        self.setNeedsUpdateConstraints()
        
        bar.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
    }
}
