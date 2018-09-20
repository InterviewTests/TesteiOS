//
//  InfoCell.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        downloadButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    func configureView(for info: FundInfo) {
        nameLabel.text = info.name
        if let data = info.data {
            dataLabel.isHidden = false
            dataLabel.text = data
        } else {
            downloadButton.isHidden = false
        }
    }

    @objc func onTap() {
        NotificationCenter.default.post(name: Notification.Name("downInfo"), object: nil)
    }
}
