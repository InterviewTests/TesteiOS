//
//  InvestmentFundsInfoTableViewCell.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol InvestmentFundsInfoTableViewCellProtocol {
    func downloadRequest()
}

class InvestmentFundsInfoTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var btnDownload: UIButton!
    
    // MARK: - Delegate
    var delegate: InvestmentFundsInfoTableViewCellProtocol?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    // MARK: - Public Methods
    func setup(info: Info, infoType: InfoTypeEnum?) {
        lblDescription.text = info.name
        
        if infoType == .info {
            btnDownload.isHidden = true
            lblValue.isHidden = false

            lblValue.text = info.data ?? ""
            
            return
        }
        
        btnDownload.isHidden = false
        lblValue.isHidden = true
    }
    
    // MARK: - Actions
    @IBAction func downloadClick(_ sender: Any) {
        delegate?.downloadRequest()
    }
}
