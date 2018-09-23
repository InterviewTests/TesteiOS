//
//  InfoDownTableViewCell.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 17/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

class InfoDownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var btDownload: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func downloadData(){
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
    }
}
