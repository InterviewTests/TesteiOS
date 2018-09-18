//
//  CustomTabBarController.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTabBarController: UITabBarController {
    
    let segControlHeight: CGFloat = 50
    let selIndicatorHeight: CGFloat = 3
    let distance: CGFloat = 20
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - segControlHeight, width: UIScreen.main.bounds.width, height: segControlHeight))
        
        view.addTarget(self, action: #selector(changeViewController), for: .valueChanged)
        view.insertSegment(withTitle: "Investimento", at: 0, animated: false)
        view.insertSegment(withTitle: "Contato", at: 1, animated: false)
        
        
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        view.setTitleTextAttributes(attributes, for: .normal)
        view.setTitleTextAttributes(attributes, for: .selected)
        
        view.tintColor = #colorLiteral(red: 0.7044275715, green: 0.1301777592, blue: 0.1631721134, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
        view.selectedSegmentIndex = 0
        
        view.removeBorders()
        
        return view
    }()
    
    lazy var selectedIndicatorView: UIView = {
        let view = UIView(frame: CGRect(x: -1, y: segmentedControl.frame.origin.y - selIndicatorHeight, width: UIScreen.main.bounds.width / 2, height: selIndicatorHeight))
        view.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
        
        return view
    }()
    
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
            segmentedControl.frame = segmentedControl.frame.offsetBy(dx: 0, dy: -distance)
            let view = UIView(frame: segmentedControl.frame.offsetBy(dx: 0, dy: distance))
            view.backgroundColor = #colorLiteral(red: 0.8400359154, green: 0.1495425105, blue: 0.1842575967, alpha: 1)
            self.view.addSubview(view)
        }
        
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
