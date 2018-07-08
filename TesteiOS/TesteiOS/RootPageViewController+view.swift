//
//  RootPageViewController+ViewConfig.swift
//  TesteiOS
//
//  Created by Felipe Borges on 08/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

extension RootPageViewController {
    
    func setupView() {
        setupButtons()
        setupLines()
    }
    
    func updateButtons() {
        UIView.animate(withDuration: 0.3) {
            let isFirstSelected = self.currentIndex == 0
            
            self.investmentsButton.backgroundColor =
                isFirstSelected ? UIColor.CustomColor.strongRed : UIColor.CustomColor.vividRed
            self.contactButton.backgroundColor =
                isFirstSelected ? UIColor.CustomColor.vividRed : UIColor.CustomColor.strongRed
            self.leftLine.alpha = isFirstSelected ? 1 : 0
            self.rightLine.alpha = isFirstSelected ? 0 : 1
        }
        
        
    }
    
    fileprivate func setupButtons() {
        
        // Left button
        let leftButton = UIButton(type: .custom)
        leftButton.setTitle("Investimento", for: .normal)
        leftButton.backgroundColor = UIColor.CustomColor.vividRed
        view.addSubview(leftButton)
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leftButton.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: .touchUpInside)
        
        investmentsButton = leftButton
        
        // Right button
        let rightButton = UIButton(type: .custom)
        rightButton.setTitle("Contato", for: .normal)
        rightButton.backgroundColor = UIColor.CustomColor.vividRed
        view.addSubview(rightButton)
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        rightButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        
        contactButton = rightButton
        
        let font = UIFont(name: "DINPro-Medium", size: 18)
        leftButton.titleLabel?.font = font ?? UIFont.systemFont(ofSize: 18)
        rightButton.titleLabel?.font = font ?? UIFont.systemFont(ofSize: 18)
    }
    
    fileprivate func setupLines() {
        // Left line
        let leftLine = UIView()
        leftLine.backgroundColor = UIColor.CustomColor.vividRed
        view.addSubview(leftLine)
        
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.bottomAnchor.constraint(equalTo: investmentsButton.topAnchor).isActive = true
        leftLine.centerXAnchor.constraint(equalTo: investmentsButton.centerXAnchor).isActive = true
        leftLine.widthAnchor.constraint(equalTo: investmentsButton.widthAnchor).isActive = true
        leftLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        leftLine.alpha = 0
        
        self.leftLine = leftLine
        
        // Right line
        let rightLine = UIView()
        rightLine.backgroundColor = UIColor.CustomColor.vividRed
        view.addSubview(rightLine)
        
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.bottomAnchor.constraint(equalTo: contactButton.topAnchor).isActive = true
        rightLine.centerXAnchor.constraint(equalTo: contactButton.centerXAnchor).isActive = true
        rightLine.widthAnchor.constraint(equalTo: contactButton.widthAnchor).isActive = true
        rightLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        rightLine.alpha = 0
        
        self.rightLine = rightLine
        
    }
}
