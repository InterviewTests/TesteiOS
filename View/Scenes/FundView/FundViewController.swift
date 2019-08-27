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
        
        // Refresh Control
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.tintColor = ThemeManager.current().primaryColor
        tableView?.addSubview(self.refreshControl!)
        self.refreshControl?.beginRefreshing()
        
        // NavBar styling
        ThemeManager.applyNavBarStyle(self.navigationController?.navigationBar)
        
        // Register cells
        tableView.register(UINib(nibName: "ButtonViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
        
        presenter.viewDidLoad()
    }
    
    // MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var result: UITableViewCell!
        // First Cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fundCell", for: indexPath) as! FundViewCell
            cell.prepareForReuse()
            presenter.configure(cell: cell)
            result = cell
        }
        // Last cell
        else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonViewCell
            cell.prepareForReuse()
            presenter.configure(cell: cell)
            result = cell
        }
        // Fund Info Cell
        else if indexPath.row < presenter.getRowStartPositionOfFundDownInfo() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fundInfoCell", for: indexPath) as! FundInfoViewCell
            cell.prepareForReuse()
            presenter.configure(cell: cell, at: indexPath.row)
            result = cell
        }
        // Fund Down Info Cell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fundDownInfoCell", for: indexPath) as! FundDownInfoViewCell
            cell.prepareForReuse()
            presenter.configure(cell: cell, at: indexPath.row)
            result = cell
        }
        
        return result
    }
    
    
    // MARK: unwind Segue
    @IBAction func unwindToFundViewController(segue: UIStoryboardSegue) {
        // does nothing at all
    }

}


extension FundViewController: FundView {
    func refresh() {
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func goToFundDetails() {
        performSegue(withIdentifier: "toFundDetail", sender: nil)
    }
    
    
}
