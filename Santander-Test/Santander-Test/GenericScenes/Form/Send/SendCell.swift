//
//  SendCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol SendCellDelegate: class {
    func buttonPressed()
}

class SendCell: UITableViewCell {
    
    @IBOutlet weak var button: SendButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "SendCell"
    
    weak var delegate: SendCellDelegate?
    
    var viewModel: SendCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.delegate = self
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        button.setTitle(viewModel.message ?? "-", for: .normal)
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
        bottomConstraint.constant = CGFloat(viewModel.bottomSpace)
    }
}

extension SendCell: SendButtonDelegate {
    func buttonPressed() {
        delegate?.buttonPressed()
    }
}

extension SendCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
        let bottomSpace: Int
        
        init(message: String?, topSpace: Int?, bottomSpace: Int = 16) {
            self.message = message
            self.topSpace = topSpace
            self.bottomSpace = bottomSpace
        }
    }
}
