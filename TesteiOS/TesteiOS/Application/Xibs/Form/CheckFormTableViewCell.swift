//
//  CheckFormTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

protocol CheckFormTableViewCellDelegate:class {
    func removeCEll()
    func showCELL()
    var state:Bool{get set}
}

class CheckFormTableViewCell: UITableViewCell {

    @IBOutlet weak var btnCheck: UIButton!
    var check:Bool = false
    
    weak var delegate:CheckFormTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cell:CellList) {
        self.btnCheck.setImage(UIImage(named: "unchecked"), for: .normal)
        self.check = false
    }
    
    @IBAction func btnCheckTapped(_ sender: Any) {
        self.btnCheck.setImage(UIImage(named: "unchecked"), for: .normal)
        self.delegate?.removeCEll()
        if !self.check {
            self.btnCheck.setImage(UIImage(named: "checked"), for: .normal)
            self.delegate?.state = true
            self.delegate?.showCELL()
        }
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "CheckFormTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CheckFormTableViewCell")
    }
    
}
