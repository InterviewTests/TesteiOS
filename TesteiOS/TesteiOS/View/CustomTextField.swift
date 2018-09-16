//
//  CustomTextField.swift
//  TesteiOS
//
//  Created by Nicolau on 13/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    var statusView: StatusView!
    var customPlaceholderLabel: CustomPlaceholderLabel!
    
    override func awakeFromNib() {
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    
    func updateView() {
        self.borderStyle = .none
        
        customPlaceholderLabel = CustomPlaceholderLabel(frame: self.frame)
        customPlaceholderLabel.changeStatus(to: .noFocus)
        self.addSubview(customPlaceholderLabel)
        
        statusView = StatusView(frame: self.frame)
        statusView.changeStatus(to: .noFocus)
        self.addSubview(statusView)
        
        self.bringSubview(toFront: statusView)
    }
}
