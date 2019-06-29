//
//  UIImageExtension.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 28/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

extension UIImage
{
    class func imageWith(color: UIColor, size: CGSize) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(.init(origin: .zero, size: size))
        
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
