//
//  SantanderLabelView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit


class SantanderLabelView: UIView {
    @IBOutlet private weak var titleLabel : UILabel!

    @IBInspectable var fontSize    : CGFloat = 16
    @IBInspectable var textColor   : UIColor = UIColor.black
    @IBInspectable var littleSpace : CGFloat = 16
    
    
    init(fontSize : CGFloat, textColor : UIColor) {
        self.fontSize   = fontSize
        self.textColor  = textColor
        super.init(frame: .zero)
        self.xib()
        self.prepareLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        self.titleLabel.font      = titleLabel.font.withSize(fontSize)
        self.titleLabel.textColor = textColor
    }
    
    func set(text : String? = "") {
        self.titleLabel.text = text
        self.frame.size.height = titleLabel.intrinsicContentSize.height + littleSpace
        self.invalidateIntrinsicContentSize()
    }
    
    func set(textColor : UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        self.titleLabel.textColor = textColor
    }
    
    func set(alignment : NSTextAlignment) {
        self.titleLabel.textAlignment = alignment
    }
}
