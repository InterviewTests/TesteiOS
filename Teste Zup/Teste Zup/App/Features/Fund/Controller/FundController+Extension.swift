//
//  FundController+Extension.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 25/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension FundController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(styleGuide: .shareButton)
        if let fundView = self.usedView as? FundView {
            fundView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
            fundView.tableView.delegate = self
            fundView.tableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fundViewModel.countInfo
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FundTableViewCell?
        if let fundView = self.usedView as? FundView {
            cell = fundView.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? FundTableViewCell
        } else {cell = UITableViewCell() as? FundTableViewCell}
        
        fundViewModel.fetchFund { (fund) in
            self.fundViewModel.fund = fund
            cell?.fundViewModel?.row = indexPath.row
            cell?.fundViewModel = self.fundViewModel
        }
        return cell ?? UITableViewCell()
    }
}
