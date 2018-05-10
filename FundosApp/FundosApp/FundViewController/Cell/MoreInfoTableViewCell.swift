//
//  MoreInfoTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit
class MoreInfoTableDataViewCell:MoreInfoTableViewCellProtocol{
    var name: String
    
    var moreInfo: MoreInfo
    init(with screen:Screen) {
        self.name = screen.screen.infoTitle
        self.moreInfo = screen.screen.moreInfo
    }
    
}
protocol MoreInfoTableViewCellProtocol{
    var name:String{get}
    var moreInfo:MoreInfo{get}
}

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
    
    func setup(with model:MoreInfoTableViewCellProtocol){
        self.title.text = model.name
        self.next12MonthsCDI.text = "\(model.moreInfo.twelveMonths.CDI)%"
        self.monthCDI.text = "\(model.moreInfo.month.CDI)%"
        self.yearCDI.text = "\( model.moreInfo.year.CDI)%"
        
        self.next12MonthsFund.text = "\(model.moreInfo.twelveMonths.fund)%"
        self.monthFund.text = "\(model.moreInfo.month.fund)%"
        self.yearFund.text = "\( model.moreInfo.year.fund)%"

    }
    
}
