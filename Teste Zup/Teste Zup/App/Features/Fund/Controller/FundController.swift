//
//  FundController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FundController: UIViewController, ConfigurableController {
    var usedView: UIView = FundView()
    var fundViewModel = FundViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        bindViewModel()
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(styleGuide: .shareButton)
        
    }
    
    fileprivate func setupTableView() {
        if let fundView = self.usedView as? FundView {
            fundView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
            fundView.tableView.delegate = self
            fundView.tableView.dataSource = self
        }
    }
    
    fileprivate func bindViewModel() {
        fundViewModel.fetchFund(completion: { (fund) in
            self.fundViewModel.fund = fund
            if let fundView = self.usedView as? FundView {fundView.fundViewModel = self.fundViewModel}
        })
    }
}

extension FundController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        if let fundView = self.usedView as? FundView {
            cell = fundView.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        } else {cell = UITableViewCell()}
        return cell ?? UITableViewCell()
    }
}
