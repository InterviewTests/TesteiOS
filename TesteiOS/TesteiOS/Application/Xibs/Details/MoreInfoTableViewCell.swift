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
        
        guard let month12 = obj.more.months12 else { return }
        guard let month = obj.more.month else { return }
        guard let year  = obj.more.year else { return }
        
        guard let next12MonthsCDI  = month12.cDI else { return }
        guard let next12MonthsFund = month12.fund else { return }
        
        guard let monthCDI  = month.cDI else { return }
        guard let monthFund = month.fund else { return }
        
        guard let yearCDI   = year.cDI else { return }
        guard let yearFund  = year.fund else { return }
        
        
        
        self.title.text = obj.title
        self.next12MonthsCDI.text = "\(String(describing: next12MonthsCDI))%"
        self.monthCDI.text        = "\(String(describing: monthCDI))%"
        self.yearCDI.text         = "\(String(describing: yearCDI))%"
        
        self.next12MonthsFund.text = "\(String(describing: next12MonthsFund))%"
        self.monthFund.text        = "\(String(describing: monthFund))%"
        self.yearFund.text         = "\(String(describing: yearFund))%"
        
    }
    
}
