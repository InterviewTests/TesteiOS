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
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "SendCell"
    
    weak var delegate: SendCellDelegate?
    
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
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        delegate?.buttonPressed()
    }
}

extension SendCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
    }
}
