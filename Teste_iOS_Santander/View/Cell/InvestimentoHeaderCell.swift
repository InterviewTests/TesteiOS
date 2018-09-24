//
//  InvestimentoHeaderCell.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 19/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

class InvestimentoHeaderCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelFundName: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelWhatIs: UILabel!
    @IBOutlet weak var labelRiskTitle: UILabel!
    @IBOutlet weak var labelInfoTitle: UILabel!
    @IBOutlet weak var labelMonthFund: UILabel!
    @IBOutlet weak var labelMonthCDI: UILabel!
    @IBOutlet weak var labelYearFund: UILabel!
    @IBOutlet weak var labelYearCDI: UILabel!
    @IBOutlet weak var labelLastFund: UILabel!
    @IBOutlet weak var labelLastCDI: UILabel!
    @IBOutlet var arrayImageView: Array<UIImageView>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
