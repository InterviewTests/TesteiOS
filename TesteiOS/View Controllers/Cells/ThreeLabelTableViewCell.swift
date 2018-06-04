//
//  ThreeLabelTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SafariServices

protocol LoadWebView: NSObjectProtocol {
    func loadNewScreen(controller: UIViewController) -> Void;
}

class ThreeLabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiFirstLabel: UILabel?
    
    @IBOutlet weak var uiSecondLabel: UILabel?
    
    @IBOutlet weak var uiThirdLabel: UILabel?
    
    
    @IBOutlet weak var uiDownloadBtn: UIButton?
    
    var urlString = "https://www.google.com.br"
    weak var delegate: LoadWebView?
    var model:ThreeLabelCellModel = ThreeLabelCellModel(nil,nil,nil,nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    
    func setLayout() {
        uiFirstLabel?.text = model.value1
        uiSecondLabel?.text = String(describing: model.value2)
        uiThirdLabel?.text = String(describing: model.value3)
        
        guard let url = model.btnURL else {
            return
        }
        urlString = url
        
        
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
        if((delegate?.responds(to: Selector(("loadNewScreen:")))) != nil)
        {
            delegate?.loadNewScreen(controller:svc);
        }
    }

}
