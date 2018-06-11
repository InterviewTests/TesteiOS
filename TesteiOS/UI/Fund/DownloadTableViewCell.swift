//
//  DownloadTableViewCell.swift
//  TesteiOS
//
//  Created by Macbook on 11/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit

protocol DownloadTableViewCellDelegate : class {
    func btnDownloadTapped(_ tag: Int)
}
class DownloadTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    weak var downloadTableViewCellDelegate : DownloadTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnDownloadTapped(_ sender: UIButton) {
        downloadTableViewCellDelegate.btnDownloadTapped(sender.tag)
    }
}
