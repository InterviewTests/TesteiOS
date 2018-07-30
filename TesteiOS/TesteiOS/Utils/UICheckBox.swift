//
//  UICheckBox.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

@IBDesignable class UICheckBox: UIButton {

    @IBInspectable var isChecked: Bool = false {
        didSet {
            self.drawCheckImage()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        super.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        super.titleEdgeInsets.left = 10.0
        self.drawCheckImage()
    }

    
    @objc func pressed(){
        isChecked = isChecked ? false : true
    }
    
    func drawCheckImage(){

        if self.isChecked {
            super.setImage(UIImage(named: "Checked", in: Bundle(for: UICheckBox.self), compatibleWith: nil)?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            super.setImage(UIImage(named: "Unchecked", in: Bundle(for: self.classForCoder), compatibleWith: nil)?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

    }*/
    
 

}
