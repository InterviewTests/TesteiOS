//
//  FundNameTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class FundNameTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle: String
    
    init(with screen:Screen) {
        self.name = screen.screen.title
        self.subTitle = screen.screen.fundName
    }
}

protocol GenericCellProtocol{
    var name:String{get}
    var subTitle:String{get}
}
class FundNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UITextView!
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
    
    func setup(with model:GenericCellProtocol){
        self.title.text = model.name
        self.subTitle.text = model.subTitle
    }
    
    
}
