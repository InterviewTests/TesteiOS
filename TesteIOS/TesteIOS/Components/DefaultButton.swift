//
//  DefaultButton.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.Default.lightRed : UIColor.Default.red
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configButton()
    }
    
    //    MARK: - Config
    func configButton(){
        clipsToBounds = true
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.Default.red
        
        titleLabel?.textColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height/2
    }
}
