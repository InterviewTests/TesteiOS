//
//  FundosInfoTableViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 05/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit
import SafariServices

enum TypeInfoCell {
    case info
    case infoDown
}

protocol OpenSafariViewControllerProtocol : NSObjectProtocol {
    func openSafariViewController(controller: UIViewController) -> Void;
}

class FundosInfoTableViewCell: UITableViewCell {
    
    var viewModel: Fundos.InfoCell = Fundos.InfoCell() {
        didSet {
            didSetViewModel()
        }
    }

    weak var delegate: OpenSafariViewControllerProtocol?
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var buttonBaixar: UIButton!
    @IBAction func buttonClick(_ sender: UIButton) {
        openSafariViewController()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func didSetViewModel() {
        if (viewModel.typeInfoCell == TypeInfoCell.info) {
            labelData.isHidden = false
            buttonBaixar.isHidden = true
        } else {
            labelData.isHidden = true
            buttonBaixar.isHidden = false
        }
        
        labelName.text = viewModel.infoName
        labelData.text = viewModel.infoData
    }
    
    func openSafariViewController() {
        let urlString = "https://google.com"
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            if ((delegate?.responds(to: Selector(("openSafariViewController:")))) != nil) {
                delegate?.openSafariViewController(controller: vc)
            }
        }
    }
}
