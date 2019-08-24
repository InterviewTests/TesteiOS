//
//  FundViewController.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 13/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit

class FundViewController: UITableViewController {
    
    var presenter: FundViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        // NavBar styling
        ThemeManager.applyNavBarStyle(self.navigationController?.navigationBar)
        
        presenter.viewDidLoad()
    }
    
    
    
    // MARK: unwind Segue
    @IBAction func unwindToFundViewController(segue: UIStoryboardSegue) {
        // does nothing at all
    }

}


extension FundViewController: FundView {
    func refresh() {
        tableView.reloadData()
    }
    
    func goToFundDetails() {
        performSegue(withIdentifier: "toFundDetail", sender: nil)
    }
    
    
}
