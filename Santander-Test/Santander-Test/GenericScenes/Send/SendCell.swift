//
//  SendCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class SendCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    static let reuseIdentifier = "SendCell"
    
    var viewModel: SendCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        button.backgroundColor = UIColor.darkRedColor
        button.layer.cornerRadius = 25
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        button.setTitle(viewModel.message ?? "-", for: .normal)
    }
}

extension SendCell {
    struct ViewModel {
        let message: String?
    }
}
