//
//  UICustomButton.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

@IBDesignable class UICustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.updateCornerRadius()
        }
    }
    
    @IBInspectable var defaultBackgroundColor: UIColor = UIColor(red: 218/255.0, green: 1/255.0, blue: 1/255.0, alpha: 1.0) {
        didSet{
            super.backgroundColor = self.defaultBackgroundColor
        }
    }
    
    @IBInspectable var pressedBackgroundColor: UIColor = UIColor(red: 235/255.0, green: 118/255.0, blue: 118/255.0, alpha: 1.0)
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.backgroundColor = pressedBackgroundColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.backgroundColor = defaultBackgroundColor
    }
    
    func sharedInit() {
      
        super.backgroundColor = self.defaultBackgroundColor
        self.updateCornerRadius()
    }
    
    func updateCornerRadius(){
        super.layer.cornerRadius = self.cornerRadius
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }*/
    

}
