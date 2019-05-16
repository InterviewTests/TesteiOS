//
//  DownInfoTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

protocol DownInfoTableViewCellDelegate:class {
    func openSafari()
}

class DownInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate:DownInfoTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnDownloadTapped(_ sender: Any) {
        self.delegate?.openSafari()
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "DownInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DownInfoTableViewCell")
    }
    
    func setup(obj:DownInfo) {        
        if let name = obj.name {
            self.titleLabel.text = name
        }
    }
}
