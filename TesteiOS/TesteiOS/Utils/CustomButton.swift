//
//  CustomButton.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/8/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit
import QuartzCore


class CustomButton: UIButton {
    
    let animationDuration:CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp() {
        self.backgroundColor = nil
        self.clipsToBounds = true
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: 50)
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.setTitleColor(UIColor.white, for: UIControlState.selected)
        self.setBackgroundImage(UIImage.imageWithColor(color: UIColor.unselectedRed, size: self.bounds.size), for: .normal)
        self.setBackgroundImage(UIImage.imageWithColor(color: UIColor.highlightedRed, size: self.bounds.size), for: .selected)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: TimeInterval(self.animationDuration), delay: 0, options: UIViewAnimationOptions.preferredFramesPerSecond60, animations: {
            self.isSelected = true
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: TimeInterval(self.animationDuration), delay: 0, options: UIViewAnimationOptions.preferredFramesPerSecond60, animations: {
            self.isSelected = false
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
