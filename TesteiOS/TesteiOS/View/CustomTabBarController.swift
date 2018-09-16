//
//  CustomTabBarController.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

extension UISegmentedControl {
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
}

@IBDesignable
class CustomTabBarController: UITabBarController {
    
    let SEG_CONTROL_H: CGFloat = 50
    let SEL_INDICATOR_H: CGFloat = 3
    var segmentedControl: UISegmentedControl!
    var selectedIndicatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    
    func updateView() {
        if UIScreen.main.bounds.height >= 812 {
            segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - SEG_CONTROL_H - 20, width: UIScreen.main.bounds.width, height: SEG_CONTROL_H))
            let view = UIView(frame: segmentedControl.frame.offsetBy(dx: 0, dy: 20))
            view.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
            self.view.addSubview(view)
        } else {
            segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - SEG_CONTROL_H, width: UIScreen.main.bounds.width, height: SEG_CONTROL_H))
        }
        
        selectedIndicatorView = UIView(frame: CGRect(x: -1, y: segmentedControl.frame.origin.y - SEL_INDICATOR_H, width: UIScreen.main.bounds.width / 2, height: SEL_INDICATOR_H))
        selectedIndicatorView.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
        
        segmentedControl.addTarget(self, action: #selector(changeViewController), for: .valueChanged)
        segmentedControl.insertSegment(withTitle: "Investimento", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Contato", at: 1, animated: false)

        
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(attributes, for: .normal)
        segmentedControl.setTitleTextAttributes(attributes, for: .selected)
        
        segmentedControl.tintColor = #colorLiteral(red: 0.7044275715, green: 0.1301777592, blue: 0.1631721134, alpha: 1)
        segmentedControl.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.removeBorders()
        
        self.view.addSubview(segmentedControl)
        self.view.addSubview(selectedIndicatorView)
    }
    
    @objc func changeViewController() {
        self.selectedIndex = segmentedControl.selectedSegmentIndex
        
        UIView.animate(withDuration: 0.15) {
            if self.selectedIndex == 0 {
                self.selectedIndicatorView.transform = CGAffineTransform(translationX: 0, y: 0)
            } else {
                self.selectedIndicatorView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width - self.selectedIndicatorView.frame.width + 1, y: 0)
            }
        }
    }
}
