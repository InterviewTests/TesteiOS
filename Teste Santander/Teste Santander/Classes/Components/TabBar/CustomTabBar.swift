//
//  CustomTabBar.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol CustomTabBarDelegate {
    /// Tab Click Event
    /// - Parameter index: index of selected tab
    func didSelectTab(index: Int)
}

@IBDesignable
class CustomTabBar: UIView {
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackTab: UIStackView!
    
    var selectedTab = 0
    
    // MARK: - Delegate
    var delegate: CustomTabBarDelegate?
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initNib()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        initNib()
    }
    
    // MARK: - PrivateMethods
    fileprivate func initNib() {
        let bundle = Bundle(for: CustomTabBar.self)
        bundle.loadNibNamed(String(describing: CustomTabBar.self), owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: - Public Methods
    func setup(tabBarItems: [String]) {
        for index in (0...tabBarItems.count - 1) {
            let button = UIButton()
            
            button.backgroundColor = ColorUtils.buttonRed
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = FontUtils.mediumInfoTitle
            button.setTitle(tabBarItems[index], for: .normal)
            button.tag = index
            
            stackTab.addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(didSelectIndex(_:)), for: .touchUpInside)
            button.topAnchor.constraint(equalTo: stackTab.topAnchor, constant: 2).isActive = true
        }
    }
    
    func setSelectedTab(index: Int) {
        for case let button as UIButton in stackTab.arrangedSubviews {
            let bottomConstraint = button.superview!.constraints.filter({ $0.firstAttribute == .top && $0.firstItem === button}).first!
            
            if button.tag == index {
                button.backgroundColor = ColorUtils.buttonTabSelectedRed
                bottomConstraint.constant = 0
            } else {
                button.backgroundColor = ColorUtils.buttonRed
                bottomConstraint.constant = 2
            }
        }
        
        selectedTab = index
    }
    
    // MARK: - Actions
    @objc func didSelectIndex(_ sender: UIButton) {
        setSelectedTab(index: sender.tag)
        
        delegate?.didSelectTab(index: sender.tag)
    }
}
