//
//  CheckBoxButton.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/20/18.
//  Reference cocoapods.org/pods/CheckboxButton
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit

@IBDesignable
class CheckboxButton: UIControl {
    
    @IBInspectable var containerLineWidth : CGFloat = 1.0
    @IBInspectable var containerColor : UIColor = UIColor.lightGray
    @IBInspectable var containerFillsOnToggleOn : Bool = true
    @IBInspectable var on : Bool = false {
        didSet {
            colorLayers()
        }
    }
    
    
    let containerLayer = CAShapeLayer()
    
    var containerFrame: CGRect {
        let width = bounds.width
        let height = bounds.height
        
        let x: CGFloat
        let y: CGFloat
        
        let sideLength: CGFloat
        if width > height {
            sideLength = height
            x = (width - sideLength) / 2
            y = 0
        } else {
            sideLength = width
            x = 0
            y = (height - sideLength) / 2
        }
        
        let halfLineWidth = containerLineWidth / 2
        return CGRect(x: x + halfLineWidth, y: y + halfLineWidth, width: sideLength - containerLineWidth, height: sideLength - containerLineWidth)
    }
    
    var containerPath: UIBezierPath {
        
        return UIBezierPath(rect: containerFrame)
    }
    
    

    //MARK: - Layout
    /*********************************************************************/
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Also layout the layers when laying out subviews
        layoutLayers()
    }
    
    func layoutLayers() {
        containerLayer.frame = bounds
        containerLayer.lineWidth = containerLineWidth
        containerLayer.path = containerPath.cgPath
    }
    
    func colorLayers() {
        containerLayer.strokeColor = containerColor.cgColor
        
        // Set colors based on 'on' property
        if on {
            containerLayer.fillColor = UIColor.red.cgColor
        } else {
            containerLayer.fillColor = UIColor.clear.cgColor
        }
    }
    
    static let validBoundsOffset: CGFloat = 80
    
    
    
    
    
    
    //MARK: - Initialization
    /*********************************************************************/
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        customInitialization()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }
    
    func customInitialization() {
        
        // Color and layout layers
        colorLayers()
        layoutLayers()
        
        // Add layers
        layer.addSublayer(containerLayer)
    }
    
    
    
    //MARK: - Touch Tracking
    /*********************************************************************/

    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        return true
    }
    
    open override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        return true
    }
    
    open override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touchLocationInView = touch?.location(in: self) else {
            return
        }
        
        let offset = type(of: self).validBoundsOffset
        let validBounds = CGRect(x: bounds.origin.x - offset, y: bounds.origin.y - offset, width: bounds.width + (2 * offset), height: bounds.height + (2 * offset))
        
        if validBounds.contains(touchLocationInView) {
            on = !on
            sendActions(for: [UIControlEvents.valueChanged])
        }
    }
    
    
    
    //MARK: - Interface Builder
    /*********************************************************************/
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        customInitialization()
    }
    
    
}
