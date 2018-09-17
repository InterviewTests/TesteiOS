//
//  DownloadInfoTableViewCell.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

protocol DownloadInfoTableViewCellDelegate: class {
    func downloadInfoCell(_ downloadInfoCell: DownloadInfoTableViewCell, downloadButtonTapped downloadButton: UIButton)
}

class DownloadInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    weak var delegate: DownloadInfoTableViewCellDelegate?
    
    @IBAction func downloadButtonTapped(_ button: UIButton) {
        delegate?.downloadInfoCell(self, downloadButtonTapped: button)
    }
    
}
