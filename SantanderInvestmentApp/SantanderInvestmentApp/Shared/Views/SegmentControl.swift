//
//  SegmentControl.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

protocol SegmentedControlDelegate: class {
    func didChangeTab(index: Int)
}

class SegmentedControl: UISegmentedControl {
    weak var delegate: SegmentedControlDelegate?
    
    override init(items: [Any]?) {
        super.init(items: items)
        let font = UIFont.regularFont(of: 16)
        self.setTitleTextAttributes([NSAttributedStringKey.font: font,
                                     NSAttributedStringKey.foregroundColor: UIColor.white],
                                    for: .normal)
        self.setTitleTextAttributes([NSAttributedStringKey.font: font,
                                     NSAttributedStringKey.foregroundColor: UIColor.white],
                                    for: .selected)
        let screenSize = UIScreen.main.bounds
        self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 55)
        self.addUnderlineForSelectedSegment()
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
        sender.changeUnderlinePosition()
    }
}

extension SegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
    
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.segmentedRed.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let font = UIFont.regularFont(of: 16)
        
        self.setTitleTextAttributes([NSAttributedStringKey.font: font,
                                     NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
        self.setTitleTextAttributes([NSAttributedStringKey.font: font,
                                     NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
    }
    
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 3.0
        var underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        if selectedSegmentIndex < 0 {
            underlineXPosition = CGFloat(0)
        }
        let underLineYPosition = -2.0
        let underlineFrame = CGRect(x: underlineXPosition, y: CGFloat(underLineYPosition), width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.segmentedRed
        underline.tag = 1
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        underline.frame.origin.x = underlineFinalXPosition
    }
}
