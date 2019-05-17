//
//  FundRisk.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 16/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class FundRisk: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var lightGreenView: UIView!
    @IBOutlet weak var darkGreenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var darkRedView: UIView!
    
    static let reuseIdentifier = "FundRisk"
    
    var viewModel: FundRisk.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        label.textColor = UIColor.darkGrayColor
    }
    
    private func didSetViewModel() {
        guard
            let viewModelRisk = viewModel?.risk,
            1...5 ~= viewModelRisk
        else { return }
        
//        switch viewModel.risk {
//        case 1:
//
//        default:
//            darkRedView
//        }
    }
    
}

extension FundRisk {
    struct ViewModel {
        let risk: Int?
    }
}
