//
//  MoreInfoTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var next12MonthsCDI: UILabel!
    @IBOutlet weak var yearCDI: UILabel!
    @IBOutlet weak var monthCDI: UILabel!
    
    @IBOutlet weak var next12MonthsFund: UILabel!
    @IBOutlet weak var yearFund: UILabel!
    @IBOutlet weak var monthFund: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "MoreInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MoreInfoTableViewCell")
    }
    
    func setup(obj:MoreInformation) {
        
        self.title.text = obj.title
        self.next12MonthsCDI.text = "\(String(describing: obj.more.months12?.cDI))%"
        self.monthCDI.text        = "\(String(describing: obj.more.month?.cDI))%"
        self.yearCDI.text         = "\(String(describing: obj.more.year?.cDI))%"
        
        self.next12MonthsFund.text = "\(String(describing: obj.more.months12?.fund))%"
        self.monthFund.text        = "\(String(describing: obj.more.month?.fund))%"
        self.yearFund.text         = "\(String(describing: obj.more.year?.fund))%"
        
    }
    
}
