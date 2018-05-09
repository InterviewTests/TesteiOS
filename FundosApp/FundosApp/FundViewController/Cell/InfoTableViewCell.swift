//
//  InfoTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class InfoTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle: String
    
   
    init(with info:Info) {
        self.name = info.name
        self.subTitle = info.data ?? "Não informado"
    }
}


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
    
    func setup(with model:GenericCellProtocol){
        nameLabel.text = model.name
        subTitleLabel.text = model.subTitle
        
    }
    
}
