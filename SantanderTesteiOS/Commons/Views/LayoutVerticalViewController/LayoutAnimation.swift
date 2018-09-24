//
//  SantanderLabelView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation
import UIKit


struct Animation {
    let duration : TimeInterval
    let closure  : (UIView)-> Swift.Void
}

extension Animation {
    static func animate(duration : TimeInterval = 0.3)-> Animation {
        return Animation(duration: duration, closure: {$0.layoutIfNeeded()})
    }
    
    static func fadeIn(duration : TimeInterval = 0.3)-> Animation {
        return Animation(duration: duration, closure: { $0.alpha = 1 })
    }
    
    static func move(to origin : CGPoint, duration : TimeInterval = 0.3)-> Animation {
        return Animation(duration: duration, closure: { $0.frame.origin = origin })
    }
    
    static func resize(to size : CGSize, duration : TimeInterval = 0.3)-> Animation {
        return Animation(duration: duration, closure: { $0.bounds.size = size })
    }
}

extension UIView {
    
    func animate(_ animations : [Animation]) {
        guard !animations.isEmpty else {
            return
        }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            self.animate(animations)
        })
    }
    
    func animate(inParallel animations : [Animation]) {
        guard !animations.isEmpty else {
            return
        }
        animations.forEach { animation in
            UIView.animate(withDuration: animation.duration, animations: {
                animation.closure(self)
            })
        }
    }
}
