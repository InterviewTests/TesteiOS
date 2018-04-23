//
//  SegmentedControl.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 23/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol SegmentedControlDelegate: class {
    func didChangeTab(index: Int)
}

class SegmentedControl: UISegmentedControl {
    weak var delegate: SegmentedControlDelegate?
    
    override init(items: [Any]?) {
        super.init(items: items)
        let font = UIFont.regularFont(of: 16)
        self.setTitleTextAttributes([NSAttributedStringKey.font: font],
                                    for: .normal)
        let screenSize = UIScreen.main.bounds
        self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 55)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

extension SegmentedControl {
    func setup() {
        self.backgroundColor = UIColor.segmentedRed
        self.tintColor = UIColor.segmentedRed
        self.layer.borderWidth = 0
        self.selectedSegmentIndex = 0
        self.addTarget(self, action: #selector(didChangeTab), for: .valueChanged)
    }
}

extension SegmentedControl {
    @objc
    func didChangeTab(sender: SegmentedControl) {
        delegate?.didChangeTab(index: sender.selectedSegmentIndex)
    }
}

