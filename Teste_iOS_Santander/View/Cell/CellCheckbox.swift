//
//  CelllCheckbox.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 22/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

class CellCheckbox: UITableViewCell {

    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var buttonEmailCad: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buttonEmailCad.layer.cornerRadius = 5.0
        buttonEmailCad.layer.borderWidth = 1.0
        buttonEmailCad.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setButtonState() {
        if buttonEmailCad.isSelected {
            UserDefaults.standard.set(false, forKey: "receiveEmail")
            buttonEmailCad.isSelected = false
            buttonEmailCad.backgroundColor = UIColor.white
            buttonEmailCad.layer.borderColor = UIColor.gray.cgColor
        } else {
            buttonEmailCad.isSelected = true
            buttonEmailCad.backgroundColor = UIColor.red
            buttonEmailCad.layer.borderColor = UIColor.clear.cgColor
            UserDefaults.standard.set(true, forKey: "receiveEmail")
        }
    }
    
}
