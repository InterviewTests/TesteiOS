//
//  DowninfoTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 22/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class DowninfoTableViewCell: CusomTableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var baixarButtonText: UIButton!
    @IBOutlet weak var baixarButtonImage: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openLink(sender: Any){
        UIApplication.shared.open(URL(string : "http://google.com")!, options: [:], completionHandler: { (status) in})
    }

}
