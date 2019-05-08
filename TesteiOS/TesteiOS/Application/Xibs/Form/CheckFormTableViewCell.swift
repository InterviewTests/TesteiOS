//
//  CheckFormTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

protocol CheckFormTableViewCellDelegate:class {
    func removeCEll(show:Int, check:Bool, row:Int)
    func showCELL(check:Bool, row:Int)
}

class CheckFormTableViewCell: UITableViewCell {

    @IBOutlet weak var btnCheck: UIButton!
    var check:Bool = true
    private var show:Int!
    private var row:Int!
    
    weak var delegate:CheckFormTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cell:CellList, _ check:Bool = true, row:Int) {
        self.row = row
        guard let value = cell.show else {
            return
        }
        self.show = value
        self.check = check
        self.btnCheck.setImage(UIImage(named: "checked"), for: .normal)
        if !check {
            self.btnCheck.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    
    @IBAction func btnCheckTapped(_ sender: Any) {
        if !self.check {
            self.btnCheck.setImage(UIImage(named: "checked"), for: .normal)
            self.check = true
            self.delegate?.showCELL(check: self.check, row: self.row)
        }else{
            self.check = false
            self.btnCheck.setImage(UIImage(named: "unchecked"), for: .normal)
            self.delegate?.removeCEll(show: self.show, check: self.check, row: self.row)
        }
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "CheckFormTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CheckFormTableViewCell")
    }
    
}
