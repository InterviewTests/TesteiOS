//
//  TitleFormTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit


class TitleTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle:String
    
    init(with cell:Cell) {
        self.name = cell.message
        self.subTitle = ""
    }
}




class TitleFormTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "TitleFormTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TitleFormTableViewCell")
    }
    
    func setup(with model:GenericCellProtocol){
        self.titleLabel.text = model.name
    }
    
}
