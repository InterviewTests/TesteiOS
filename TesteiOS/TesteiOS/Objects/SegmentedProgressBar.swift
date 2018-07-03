//
//  SegmentedProgressBar.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/28/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit


@IBDesignable class SegmentedProgressBar: UIView {
    
    @IBInspectable var segmentWidth: CGFloat = 20
    @IBInspectable var segmentHeight: CGFloat = 20
    @IBInspectable var segment1Color: UIColor = .black
    @IBInspectable var segment2Color: UIColor = .black
    @IBInspectable var segment3Color: UIColor = .black
    @IBInspectable var segment4Color: UIColor = .black
    @IBInspectable var segment5Color: UIColor = .black
    @IBInspectable var highlightSegment : Int = 4
    
    var numberOfSegments: Int = 5
    var segments = [UIView]()
    var colors = [UIColor]()

    
    override func draw(_ rect: CGRect) {
        segments = []
        colors = [segment1Color, segment2Color, segment3Color, segment4Color, segment5Color]
        
        drawSegments()
    }
    
    
    func drawSegments() {
        
        let normalSegmentHeight = segmentHeight
        let highlightSegmentHeight = segmentHeight + 4
        
        for index in 0..<numberOfSegments {
            
            if (index == highlightSegment-1) {
                segmentHeight = highlightSegmentHeight
            } else {
                segmentHeight = normalSegmentHeight
            }
            
            let segment = UIView(frame: CGRect(x: bounds.midX - (CGFloat(numberOfSegments) * segmentWidth/2) + (CGFloat(index) * segmentWidth),
                                                y: bounds.midY - segmentHeight/2,
                                                width: segmentWidth,
                                                height: segmentHeight))
            segment.backgroundColor = colors[index]
            
            
            // the first and last segments are rounded
            if (index == 0) {
                segment.clipsToBounds = true
                segment.layer.cornerRadius = .pi
                segment.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

            } else if (index == numberOfSegments - 1) {
                segment.clipsToBounds = true
                segment.layer.cornerRadius = .pi
                segment.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]

            }
            
            
            addSubview(segment)
            segments.append(segment)
            
        }
    }
    
    
}

