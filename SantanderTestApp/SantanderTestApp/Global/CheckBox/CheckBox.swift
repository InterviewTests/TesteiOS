//
//  CheckBox.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 25/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

@IBDesignable class CheckBox: UIView {
    
    // MARK: State
    
    var isChecked: Bool = false {
        didSet {
            updateView(isChecked)
        }
    }
    
    // MARK: Views
    
    lazy var label: UILabel = {
        let me = UILabel(frame: .zero)
        me.font = R.font.dinProRegular(size: 16)
        me.textColor = UIColor._grey
        return me
    }()
    
    let rectangle: UIView = {
        let me = UIView(frame: .zero)
        me.layer.borderWidth = 1
        me.layer.borderColor = UIColor._darkGrey.cgColor
        me.layer.cornerRadius = 1
        return me
    }()
    
    let filledRectangle: UIView = {
        let me = UIView(frame: .zero)
        me.backgroundColor = UIColor._red
        me.layer.cornerRadius = 1
        return me
    }()
    
    lazy var stack: UIStackView = {
        let me = UIStackView(arrangedSubviews: [rectangle, label])
        me.alignment = .center
        me.distribution = .fill
        me.spacing = 9
        return me
    }()
    
    private func buildViewHierarchy() {
        addSubview(stack)
        
        stack.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        rectangle.snp.makeConstraints {
            $0.width.height.equalTo(19)
        }
        
        rectangle.addSubview(filledRectangle)
        filledRectangle.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(2)
            $0.right.bottom.equalToSuperview().inset(2)
        }
    }
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        buildViewHierarchy()
        
        isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleState))
        addGestureRecognizer(tap)
        
        isChecked = false
    }
    
    // MARK: Core
    
    func updateView(_ state: Bool) {
        if isChecked {
            let v = filledRectangle
            v.isHidden = false
            UIView.animate(withDuration: 0.04, animations: {
                v.transform = .identity
            })
        } else {
            let v = filledRectangle
            UIView.animate(withDuration: 0.04, animations: {
                v.transform = v.transform.scaledBy(x: 0.2, y: 0.2)
            }, completion: { _ in
                v.isHidden = true
            })
        }
    }
    
    @objc public func toggleState(_ sender: UITapGestureRecognizer) {
        isChecked = !isChecked
    }
    
}
