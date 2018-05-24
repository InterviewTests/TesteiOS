//
//  Label+spaceLine.swift
//  TesteiOS
//
//  Created by Naville Brasil on 17/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    //Method for set lineSpacing
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0)
    {
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText
        {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        }
        else
        {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
