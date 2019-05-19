//
//  Resource+Image.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

extension Resource {
    
    internal enum Image: String {
        
        case checkbox
        case checkboxFilled = "checkbox_filled"
        case share
        
        var image: UIImage {
            guard let image = UIImage(named: self.rawValue) else {
                fatalError("The image named \(self.rawValue) was not found!")
            }
            return image
        }
    }
    
}
