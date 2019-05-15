//
//  TextCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "TextCell"
    
    var viewModel: TextCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        label.text = viewModel.message ?? "-"
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
    }
}

extension TextCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
    }
}
