//
//  InvestmentInfoView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentInfoView: UIView {
    @IBOutlet private weak var tableView : UITableView!
    
    private var allFunds : [Fundable] = []
    
    
    init() {
        super.init(frame: .zero)
        self.xib()
        self.prepareLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.isScrollEnabled = false
        tableView.rowHeight       = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle  = .none
        tableView.tableFooterView = UIView()
        tableView.register(class: InvestmentInfoTableViewCell.self)
        tableView.register(class: InvestmentDownInfoTableViewCell.self)
    }
    
    func set(allFunds : [Fundable]) {
        self.allFunds = allFunds
        self.tableView.reloadData()
        
        self.layoutIfNeeded()
        self.frame.size.height = tableView.contentSize.height
        self.invalidateIntrinsicContentSize()
    }
}

extension InvestmentInfoView : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFunds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch allFunds[indexPath.item] {
        case is FundInfo:
            let cell = tableView.dequeue(cell: InvestmentInfoTableViewCell.self, indexPath: indexPath)
            cell.set(fundable: allFunds[indexPath.item])
            return cell
        default:
            let cell = tableView.dequeue(cell: InvestmentDownInfoTableViewCell.self, indexPath: indexPath)
            cell.set(fundable: allFunds[indexPath.item])
            return cell
        }   
    }
}
