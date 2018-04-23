//
//  RiskView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SnapKit

class RiskView: UIView {
    var numberOfItems: Int
    var selectedItem: Int
    var colorOfItems: [UIColor]
    var items: [UIView] = [UIView]()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_arrow_down")
        return imageView
    }()
    
    init(numberOfItems: Int, selectedItem: Int, colorOfItems: [UIColor]) {
        self.numberOfItems = numberOfItems
        self.selectedItem = selectedItem
        self.colorOfItems = colorOfItems
        
        if colorOfItems.count != numberOfItems {
            fatalError("Number of colors must be the same of the number of items")
        }
        
        if selectedItem <= 0 || selectedItem > numberOfItems {
            fatalError("Selected item must not be less or equal to 0 or bigger than number of items")
        }
        
        super.init(frame: CGRect.zero)
        setupItems()
        setupLayout()
    }
    
    override init(frame: CGRect) {
        fatalError("Must not be initialized with this init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
}

//MARK: Methods
extension RiskView {
    func setupItems() {
        for i in 0..<numberOfItems {
            let view = UIView()
            view.backgroundColor = colorOfItems[i]
            items.append(view)
            addSubview(items[i])
        }
        addSubview(arrowImageView)
    }
    
    func setupLayout() {
        var previous: UIView? = nil
        for (i, item) in items.enumerated() {
            item.backgroundColor = colorOfItems[i]
            
            item.snp.makeConstraints({ (make) in
                if let previousView = previous {
                    make.left.equalTo(previousView.snp.right).offset(1)
                } else {
                    make.left.equalTo(0)
                }
                make.width.equalTo(self.snp.width).dividedBy(items.count).offset(-1)
                if i == selectedItem - 1 {
                    make.height.equalTo(10)
                    make.top.equalTo(arrowImageView.snp.bottom).offset(4)
                } else {
                    make.height.equalTo(6)
                    make.top.equalTo(self.snp.top).offset(21)
                }
            })
            previous = item
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.width.equalTo(15)
            make.height.equalTo(13)
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(items[selectedItem - 1].snp.centerX)
        }
    }
}

