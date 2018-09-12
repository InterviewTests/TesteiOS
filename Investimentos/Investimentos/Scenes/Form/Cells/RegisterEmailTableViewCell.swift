//
//  RegisterEmailTableViewCell.swift
//  Investimentos
//
//  Created by Cmdev on 11/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class RegisterEmailTableViewCell: UITableViewCell {

    @IBOutlet weak var registerEmailLabel: UILabel!
    @IBOutlet weak var registerEmailSign: UIView!
    
    var registerEmail = true
    
    var switched: ((_ isOn: Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configRegisterEmail()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Register email button
    @objc func registerEmailAction(_ recognizer: UITapGestureRecognizer) {
        checkSwitch()
    }
    
    fileprivate func checkSwitch() {
        if registerEmail {
            registerEmail = false
            registerEmailSign.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            registerEmail = true
            registerEmailSign.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
        }
        if let switched = self.switched {
            switched(self.registerEmail)
        }
    }
    
    fileprivate func configRegisterEmail() {
        registerEmailSign.layer.borderWidth = 2
        registerEmailSign.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).cgColor
        let registerEmailTap = UITapGestureRecognizer(target: self, action: #selector(self.registerEmailAction(_:)))
        let registerEmailTapLabel = UITapGestureRecognizer(target: self, action: #selector(self.registerEmailAction(_:)))
        registerEmailSign.addGestureRecognizer(registerEmailTap)
        registerEmailLabel.addGestureRecognizer(registerEmailTapLabel)
    }

}
