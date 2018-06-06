//
//  ThreeLabelTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SafariServices

protocol NextView: NSObjectProtocol {
    func loadNewScreen(controller: UIViewController?) -> Void;
}

class ThreeLabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiFirstLabel: UILabel?
    
    @IBOutlet weak var uiSecondLabel: UILabel?
    
    @IBOutlet weak var uiThirdLabel: UILabel?
    
    @IBOutlet weak var uiDownloadBtn: UIButton?
    
    var urlString = "https://www.google.com.br"
    weak var delegate: NextView?
    var model:ThreeLabelCellModel = ThreeLabelCellModel(nil,nil,nil,nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    
    func setLayout() {
        uiFirstLabel?.text = model.value1
        uiSecondLabel?.text =  model.value2
        uiThirdLabel?.text = model.value3
        
        guard let url = model.btnURL else {
        self.uiDownloadBtn?.isHidden = true
            return

        }
        urlString = url
        self.uiDownloadBtn?.isHidden = false
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func openWebview() {
        guard let url = URL(string:self.urlString) else {
            return
        }
        let svc = SFSafariViewController(url:url)
        delegate?.loadNewScreen(controller:svc);
    
    }
    @IBAction func downloadBtnTap(_ sender: Any) {
        openWebview()
        
    }
    
}
