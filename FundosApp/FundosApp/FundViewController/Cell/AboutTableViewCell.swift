//
//  AboutTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class AboutTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle: String
    
    init(with screen:Screen) {
        self.name = screen.screen.whatIs
        self.subTitle = screen.screen.definition
    }
}

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "AboutTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AboutTableViewCell")
    }
    
    func setup(with model:GenericCellProtocol){
        self.title.text = model.name
        self.subTitle.text = model.subTitle
    }
    
    
}
