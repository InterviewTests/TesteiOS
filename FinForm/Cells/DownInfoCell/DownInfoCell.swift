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
    static var nib:UINib{
        let nibInfo = UINib(nibName: "DownInfoCell", bundle: nil)
        return nibInfo
    }
    static let height:CGFloat = 42.0
    
    var downloadCompletion:DownloadButtonPressedCompletion?
    
    func populate(info:ScreenInfo){
        if let name = info.name{
            downloadInfoTitleLabel.text = name
        }
        self.selectionStyle = .none
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
