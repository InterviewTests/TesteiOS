//
//  DownInfoTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit
class  DownInfoTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle: String
    
    init(with moreInfo:Info) {
        self.name = moreInfo.name
        self.subTitle = ""
    }
}


class DownInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openLink(_ sender: Any) {
        print("abrir google")
        UIApplication.shared.open(URL(string : "https://www.google.com")!, options: [:], completionHandler: { (status) in
        })
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "DownInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DownInfoTableViewCell")
        
        
    }
    
    func setup(with model:GenericCellProtocol){
        titleLabel.text = model.name

        
    }
}
