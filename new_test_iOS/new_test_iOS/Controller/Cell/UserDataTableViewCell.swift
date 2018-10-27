//
//  UserDataTableViewCell.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 24/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var labelValorPagamento: UILabel!
    @IBOutlet weak var labelDataPagamento: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViewcell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpViewcell(){
        self.viewCell.layer.borderWidth = 1.0
        self.viewCell.layer.borderColor = UIColor(red:0.86, green:0.87, blue:0.89, alpha:0.3).cgColor
        self.viewCell.layer.cornerRadius = 6.0
        self.viewCell.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.viewCell.layer.shadowColor = UIColor(red:0.85, green:0.89, blue:0.91, alpha:0.5).cgColor
    }
    
    private func setColor(value: Double){
        
        if value < 0 {
            self.labelValorPagamento.textColor = UIColor.red
        }else{
            self.labelValorPagamento.textColor = UIColor.green
        }
    }
    
    func loadCell (values: Statement){
        self.labelDataPagamento.text = values.date
        if let value = values.value {
            self.labelValorPagamento.text = "R$ \(String(format:"%.2f", value))"
            setColor(value: value)
        }
        self.labelTitle.text = values.title
        self.labelDesc.text = values.desc

    }

}
