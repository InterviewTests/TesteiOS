//
//  CustomCheckbox.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

enum State {
    case selected
    case notSelected
}

@IBDesignable
class CustomCheckbox: UIView {
    var sideLabel: UILabel!
    var border: UIView!
    var check: UIView!
    var text = ""
    var btnState: State = .notSelected
    let margin: CGFloat = 6
    let sideLabelDist: CGFloat = 5
    let checkSize: CGFloat = 15
    @IBInspectable var font: UIFont = UILabel().font {
        didSet {
            if sideLabel == self.sideLabel {
                sideLabel.font = font
            }
        }
    }
    
    override func awakeFromNib() {
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    
    func isSelected() -> Bool {
        return btnState == .selected
    }
    
    func updateView() {
        check = UIView(frame: CGRect(x: 0, y: 0, width: checkSize, height: checkSize))
        check.layer.cornerRadius = check.frame.width / 4
        check.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        border = UIView(frame: CGRect(x: -(margin / 2), y: -(margin / 2), width: check.frame.width + margin, height: check.frame.height + margin))
        border.layer.cornerRadius = border.frame.width / 4
        border.backgroundColor = UIColor.clear
        border.clipsToBounds = true
        border.layer.borderWidth = 2
        border.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        
        sideLabel = UILabel(frame: CGRect(x: border.frame.width + sideLabelDist, y: -self.frame.height / 4, width: UIScreen.main.bounds.width - check.frame.minX, height: self.frame.height))
        sideLabel.text = text
        sideLabel.textColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        sideLabel.backgroundColor = UIColor.clear
        
        self.layer.cornerRadius = self.frame.width / 4
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.addSubview(border)
        self.addSubview(check)
        self.addSubview(sideLabel)
    }
    
    func changeState() {
        if btnState == .selected {
            check.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.btnState = .notSelected
        } else {
            check.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
            self.btnState = .selected
        }
            
        layoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.05) {
            self.alpha = 0.5
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.05) {
            self.alpha = 0.5
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.05) {
            self.alpha = 1
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.05) {
            self.alpha = 1
        }
    }
}
