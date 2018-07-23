//
//  DownInfoCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

typealias DownloadButtonPressedCompletion = () -> Void

class DownInfoCell: UITableViewCell {
    
    @IBOutlet var downloadInfoTitleLabel: UILabel!
    
    static let identifier:String = "DownInfoCell"
    
    var downloadCompletion:DownloadButtonPressedCompletion?
    
    func populate(info:ScreenInfo){
        if let name = info.name{
            downloadInfoTitleLabel.text = name
        }
    }
    
    @IBAction func action(_ sender: Any) {
        downloadCompletion?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
