//
//  CustomPlaceholderLabel.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

class CustomPlaceholderLabel: UILabel {
    var status: Status?
    var originalFrame: CGRect!
    let yAfterAnim: CGFloat = -28
    let normalFontSize: CGFloat = 17
    let fontSizeAfterAnim: CGFloat = 13
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        originalFrame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeStatus(to status: Status) {
        switch status {
        case .focused:
            UIView.animate(withDuration: 0.15) {
                self.frame = CGRect(x: 0, y: self.yAfterAnim, width: self.originalFrame.width, height: self.originalFrame.height)
                self.font = self.font.withSize(self.fontSizeAfterAnim)
                self.textColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
            }
            break
        default:
            UIView.animate(withDuration: 0.15) {
                self.frame = CGRect(x: 0, y: 0, width: self.originalFrame.width, height: self.originalFrame.height)
                self.font = self.font.withSize(self.normalFontSize)
                self.textColor = #colorLiteral(red: 0.7333333333, green: 0.7294117647, blue: 0.7490196078, alpha: 1)
            }
            break
        }
        layoutSubviews()
    }
}
