//
//  FundNameTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class FundNameTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubtitle: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "FundNameTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FundNameTableViewCell")
    }
    
    func setup(fund:FundName) {
        
        self.lbTitle.text = fund.title
        self.lbSubtitle.text = fund.name
        
    }
    
}
