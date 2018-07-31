//
//  UICustomButton.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

@IBDesignable class UICustomButton: UIButton {

    //MARK: - Class Variables
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.updateCornerRadius()
        }
    }
    
    @IBInspectable var defaultBackgroundColor: UIColor = UIColor(red: 218/255.0, green: 1/255.0, blue: 1/255.0, alpha: 1.0) {
        didSet{
            backgroundColor = self.defaultBackgroundColor
        }
    }
    
    @IBInspectable var pressedBackgroundColor: UIColor = UIColor(red: 235/255.0, green: 118/255.0, blue: 118/255.0, alpha: 1.0)
    
    //MARK: - Class Functions
    private func updateCornerRadius(){
        layer.cornerRadius = self.cornerRadius
    }
    
    //MARK: - Overriden init methods to keep superView draw behaviours both programatically and in storyboard rendering
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
        
        backgroundColor = self.defaultBackgroundColor
        self.updateCornerRadius()
    }
    
    //MARK: - Overriden Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = self.pressedBackgroundColor
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = self.defaultBackgroundColor
        })
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }*/
    

}
