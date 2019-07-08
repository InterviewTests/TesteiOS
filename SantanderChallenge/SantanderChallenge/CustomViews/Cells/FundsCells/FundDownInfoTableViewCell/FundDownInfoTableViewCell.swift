//
// FundDownInfoTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

protocol FundDownInfoTableViewCellDelegate: AnyObject {
    func didTouchDownload(at cell: FundDownInfoTableViewCell)
}

class FundDownInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var downloadImageView: UIImageView!
    
    weak var delegate: FundDownInfoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        downloadLabel.isUserInteractionEnabled = true
        downloadImageView.isUserInteractionEnabled = true
        
        addTapGestureTo(downloadLabel)
        addTapGestureTo(downloadImageView)
    }
    
    private func addTapGestureTo(_ view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTouchAtDownload))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func didTouchAtDownload() {
        delegate?.didTouchDownload(at: self)
    }
}
