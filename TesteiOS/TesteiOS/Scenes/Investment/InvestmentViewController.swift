//
//  InvestmentViewController.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
}

extension InvestmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionOneCellId", for: indexPath) as! SectionOneTableViewCell
            
            cell.fieldOne.text = ""
            cell.fieldTwo.text = ""
            cell.fieldThree.text = ""
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTwoCellId", for: indexPath) as! SectionTwoTableViewCell
            
            cell.fieldOne.text = ""
            cell.fieldTwo.text = ""
            
            return cell
        }
    }
}
