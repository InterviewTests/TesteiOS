//
//  FundDownInfoCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 17/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol FundDownInfoCellDelegate: class {
    func buttonPressed()
}

class FundDownInfoCell: UITableViewCell {
    
    @IBOutlet weak var downInfoNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    static let reuseIdentifier = "FundDownInfoCell"
    
    weak var delegate: FundDownInfoCellDelegate?
    
    var viewModel: FundDownInfoCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        downInfoNameLabel.textColor = UIColor.darkGrayColor
        button.tintColor = UIColor.darkRedColor
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        downInfoNameLabel.text = viewModel.downInfoName ?? "-"
    }
    
    @IBAction func downloadButton(_ sender: Any) {
        delegate?.buttonPressed()
    }
}

extension FundDownInfoCell {
    struct ViewModel {
        let downInfoName: String?
    }
}
