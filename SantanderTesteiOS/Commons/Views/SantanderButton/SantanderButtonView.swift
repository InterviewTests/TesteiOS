//
//  SantanderButtonView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

enum SantanderButtonMode {
    case enabled(UIColor)
    case disabled(UIColor)
}

class SantanderButtonView: UIView {
    @IBOutlet private weak var button : UIButton!
    @IBOutlet private weak var leftConstraint   : NSLayoutConstraint!
    @IBOutlet private weak var rightConstraint  : NSLayoutConstraint!
    @IBOutlet private weak var topConstraint    : NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint : NSLayoutConstraint!
  
    var contentEdges : UIEdgeInsets = .zero
    
    var title : String?
    var mode  : SantanderButtonMode = .disabled(#colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 0.4949383803))
    
    var action : (()-> Swift.Void)?
    
    init(title : String?, mode : SantanderButtonMode) {
        self.title = title
        self.mode  = mode
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
        leftConstraint.constant     = contentEdges.left
        rightConstraint.constant    = contentEdges.right
        topConstraint.constant      = contentEdges.top
        bottomConstraint.constant   = contentEdges.bottom
        
        switch mode {
        case .enabled(let color):
            self.button.backgroundColor = color
            self.button.alpha           = 1.0
            self.button.isEnabled       = true
            self.button.setTitle(self.title, for: .normal)
        case .disabled(let color):
            self.button.backgroundColor = color
            self.button.alpha           = 0.5
            self.button.isEnabled       = false
            self.button.setTitle(self.title, for: .disabled)
        }
    }
    
    func set(corner radius : CGFloat) {
        self.button.layer.cornerRadius = radius
    }
    
    @IBAction private func buttonAction(_ sender : Any) {
        self.action?()
    }
}
