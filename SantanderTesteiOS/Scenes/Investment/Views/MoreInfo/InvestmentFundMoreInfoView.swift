//
//  InvestmentFundMoreInfoView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentFundMoreInfoView: UIView {
    @IBOutlet private weak var tableView : UITableView!
    
    private var funds : [Fund] = []
    
    private var title : String = ""
    
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
        tableView .dataSource     = self
        tableView.separatorStyle  = .none
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false
        tableView.register(class: InvestmentFundMoreInfoTableViewCell.self)
    }
    
    func set(fund : Fund?) {
        guard let fund = fund else {
            return 
        }
        self.funds.append(fund)
        self.tableView.reloadData()
    }
}

extension InvestmentFundMoreInfoView : UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: InvestmentFundMoreInfoTableViewCell.self, indexPath: indexPath)
        
        cell.set(fund: funds[indexPath.item])
        
        return cell
    }
}
