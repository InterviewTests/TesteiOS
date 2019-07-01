//
//  ScrollViewExtension.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

extension UIScrollView
{
    func screenshot(correctionValue: CGFloat) -> UIImage?
    {
        let originalContentOffset = self.contentOffset
        let originalFrame = self.frame
        
        var customContentSize = self.contentSize
        customContentSize.height -= correctionValue
        
        UIGraphicsBeginImageContext(customContentSize)
        self.contentOffset = .zero
        self.frame = .init(origin: .zero, size: customContentSize)
        
        guard let context = UIGraphicsGetCurrentContext() else
        {
            return nil
        }
        
        self.layer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.contentOffset = originalContentOffset
        self.frame = originalFrame
        
        return image
    }
}
