//
//  InvestimentoTableViewCell.swift
//  SantanderTeste
//
//  Created by Nayara on 06/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import UIKit

class InvestimentoTableViewCell: UITableViewCell {

    @IBOutlet weak var informacao: UILabel!
    @IBOutlet weak var dados: UILabel!
    @IBOutlet weak var baixar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        baixar.isHidden = true
        baixar.isEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func baixarAction(_ sender: Any) {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    

}
