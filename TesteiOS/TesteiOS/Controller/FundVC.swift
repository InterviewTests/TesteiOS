//
//  FundVC.swift
//  TesteiOS
//
//  Created by Nicolau on 15/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit
import SafariServices

class FundVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fundJSON = "fund"
    var screen: Screen!
    var info = [FundInfo]()
    let link = "https://google.com"
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitleLable: UILabel!
    @IBOutlet weak var riskView: RiskView!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var monthCDILabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var yearCDILabel: UILabel!
    @IBOutlet weak var _12MonthFundLabel: UILabel!
    @IBOutlet weak var _12MonthCDILabel: UILabel!
    @IBOutlet weak var button: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(downInfoListener), name: Notification.Name("downInfo"), object: nil)
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
        if let screen = decodeFundJSON(fromFile: fundJSON) {
            info.append(contentsOf: screen.info)
            info.append(contentsOf: screen.downInfo)
            createLayout(from: screen)
        }
    }
    
    @objc func downInfoListener() {
        if let url = URL(string: link) {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }
    
}
