//
//  FormCheckTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class FormCheckTableDataViewCell:CheckCellProtocol{
    
    var state: Bool
    var image:UIImage
    var message:String

    
    init(with cell:Cell) {
        self.message = "    \(cell.message)"

        self.state = false
        self.image = #imageLiteral(resourceName: "unchecked")
    }
    func change(){
        self.state = !self.state
        if state{
               self.image = #imageLiteral(resourceName: "checked")
        }else{
            self.image = #imageLiteral(resourceName: "unchecked")

        }
    }
}

protocol CheckCellProtocol{
    var state:Bool{get}
    var image:UIImage{get}
    var message:String{get}
    func change()

    
}

class FormCheckTableViewCell: UITableViewCell {


    @IBOutlet weak var checkButton: UIButton!
    var model:CheckCellProtocol!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "FormCheckTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FormCheckTableViewCell")
    }
    
    func setup(with model:CheckCellProtocol){
        self.model = model
       checkButton.setImage(model.image, for: .normal)
        checkButton.setTitle(model.message, for: .normal)

    }
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        self.model.change()
        checkButton.setImage(model.image, for: .normal)

    }
    
}
