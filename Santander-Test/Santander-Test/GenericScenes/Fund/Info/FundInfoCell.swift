//
//  InfoCel.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 17/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class FundInfoCell: UITableViewCell {
    
    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var infoData: UILabel!
    
    static let reuseIdentifier = "FundInfoCell"
    
    var viewModel: FundInfoCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        infoName.textColor = UIColor.darkGrayColor
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        infoName.text = viewModel.infoName ?? "-"
        infoData.text = viewModel.infoData ?? "-"
    }
}

extension FundInfoCell {
    struct ViewModel {
        let infoName: String?
        let infoData: String?
    }
}
