//
//  RiskBar.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

enum RiskType: Int {
    
    case conservative = 1
    case moderate = 2
    case balanced = 3
    case growth = 4
    case sophisticated = 5
    
    var color: UIColor {
        
        switch self {
        case .conservative:
            return Color.riskLightGreen
        case .moderate:
            return Color.riskGreen
        case .balanced:
            return Color.riskYellow
        case .growth:
            return Color.riskOrange
        case .sophisticated:
            return Color.riskRed
        }
    }
}

class RiskBar: UIView {
    
    var selectedRisk: RiskType = .moderate
    
    init(frame: CGRect, selectedRisk: RiskType) {
        super.init(frame: frame)
        self.selectedRisk = selectedRisk
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.setupView()
    }
    
    func setSelectedRisk(selectedRisk: RiskType) {
        self.selectedRisk = selectedRisk
        self.setupView()
    }
    
    func setupView() {
        print(self.frame.width)
        
        let risks:[RiskType]  = [.conservative,.moderate,.balanced,.growth,.sophisticated]
        
        let separatorWidth: CGFloat = 2.0
        let itemHeight: CGFloat = 6
        let selectedItemHeight: CGFloat = 10
        let itemWidth = (self.frame.width/5) - separatorWidth
        let itemYposition = (self.frame.height/2) - itemHeight
        
        for (index, risk) in risks.enumerated() {
            
            var itemXposition = (CGFloat(index) * (itemWidth + separatorWidth))
            if index == 0 {
                itemXposition = 0
            }
            
            var itemRect = CGRect(x: itemXposition, y: itemYposition, width: itemWidth, height: itemHeight)
            if risk == self.selectedRisk {
                itemRect = CGRect(x: itemXposition, y: itemYposition - 3, width: itemWidth, height: selectedItemHeight)
            }
            
            var riskItem = UIView(frame: itemRect)
            riskItem.backgroundColor = risk.color
            self.addSubview(riskItem)
            
            if risk == self.selectedRisk {
                let selectedArrowRect = CGRect(x: 3, y: itemYposition - 15, width: 13, height: 8)
                let selectedArrow = UIImageView(frame: selectedArrowRect)
                selectedArrow.image = UIImage(named: "arrow_icon")!
                selectedArrow.center.x = riskItem.center.x
                self.addSubview(selectedArrow)
            }
        }
    }
}
