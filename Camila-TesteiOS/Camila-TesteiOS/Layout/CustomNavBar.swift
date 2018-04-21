//
//  CustomNavBar.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
