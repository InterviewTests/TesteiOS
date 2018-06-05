//
//  RedButton.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 31/05/18.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit


class RedButton:UIButton {
    
    weak var delegate: NextView?
    
    required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)

    }
    
    
    @objc func onPress() {
    delegate?.loadNewScreen(controller:nil)
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        layer.cornerRadius = 25
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
}
