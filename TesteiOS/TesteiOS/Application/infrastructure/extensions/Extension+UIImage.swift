//
//  Extension+UIImage.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat, up:Bool) -> UIImage {
        
        var position:CGFloat?
        
        if up {
            position = size.height - size.height
        }else{
            position = size.height - lineWidth
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint(x: 0,y :position!), size: CGSize(width: size.width, height: lineWidth)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
