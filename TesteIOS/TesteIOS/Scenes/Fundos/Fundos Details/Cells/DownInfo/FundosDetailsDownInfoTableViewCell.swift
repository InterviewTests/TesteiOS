//
//  FundosDetailsDownInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FundosDetailsDownInfoTableViewCell: UITableViewCell, FundosDetailsDefaultCellProtocol {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var downloadImage: UIImageView!
    
    var delegate: FundosDetailsDefaultCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(downloadButtonTouched(_:)))
        downloadImage.addGestureRecognizer(tapGesture)
    }
    
    //    MARK: - Set
    func setInfo(info: FundosDetails.GetFund.ViewModel.DisplayedFundInfo) {
        nameLabel.text = info.name
    }

    //    MARK: - Action
    @IBAction func downloadButtonTouched(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        
        delegate.downloadButtonTouched()
    }
    
}
