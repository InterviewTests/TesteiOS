//
//  TitleFormTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class TitleFormTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cell:CellList) {
        
        if let msg = cell.message {
            self.lbTitle.text = msg
        }
        
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "TitleFormTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TitleFormTableViewCell")
    }
    
}
