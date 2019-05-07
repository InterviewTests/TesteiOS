//
//  BtnFormTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

protocol BtnFormTableViewCellDelegate: class {
    func segue(value:String)
}

class BtnFormTableViewCell: UITableViewCell {
    
    weak var delegate:BtnFormTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnSendTapped(_ sender: ButtonStyle) {
        self.delegate?.segue(value: "sgSentMessage")
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "BtnFormTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BtnFormTableViewCell")
    }
    
}
