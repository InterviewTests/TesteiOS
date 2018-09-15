//
//  CheckboxButton.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/15/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class CheckboxButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        setImage(#imageLiteral(resourceName: "button-glyph-unchecked"), for: .normal)
        setImage(#imageLiteral(resourceName: "button-glyph-checked"), for: .selected)
        addTarget(self, action: #selector(toggleSelection), for: .touchUpInside)
    }
    
    @objc func toggleSelection() {
        isSelected = !isSelected
    }

}
