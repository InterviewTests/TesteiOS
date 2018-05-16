//
//  TabBarView.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    
    @IBOutlet private weak var button: UIButton?
    
    var title: String {
        get {
            return button?.title(for: .normal) ?? ""
        }
        
        set {
            button?.setTitle(newValue, for: .normal)
        }
    }
    
    weak var viewController: UIViewController?
    var onSelected: ((TabBarView) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        transform(.customRedOne, 1, 1)
        
        layoutIfNeeded()
    }
    
    func setSelected(_ selected: Bool) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            if selected {
                self?.transform(.customRedTwo, 1.1, 1.15)
            } else {
                self?.transform(.customRedOne, 1, 1)
            }
        }
    }
    
    func transform(_ color: UIColor, _ scaleX: CGFloat, _ scaleY: CGFloat) {
        backgroundColor = color
        transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        
        superview?.layoutIfNeeded()
    }
    
    @IBAction private func tabPressed() {
        onSelected?(self)
    }
}
