//
//  CellSend.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 22/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

class CellSend: UITableViewCell {

    @IBOutlet weak var btSend: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btSend.layer.cornerRadius = 15.0
        btSend.layer.borderColor = UIColor.clear.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
}}
