//
//  InfoTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "InfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InfoTableViewCell")
    }
    
    func setup(obj:Info) {
        self.nameLabel.text = obj.name ?? ""
        self.subTitleLabel.text = obj.data ?? "Não informado"
    }
    
}
