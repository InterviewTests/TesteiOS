//
//  ProductViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController {
    
    private unowned var _view:ProductView { return self.view as! ProductView }
    
    private var presenter:ProductPresenter!
    
    override func loadView() {
        self.view = ProductView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Investimentos"
        
        _view.tableView.delegate   = self
        _view.tableView.dataSource = self

        presenter = ProductPresenter(bindTo: _view)
        presenter.requestInfo()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.destroy()
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getInfoCellFor(indexPath) ?? UITableViewCell()
    }
    
    private func getInfoCellFor(_ indexPath: IndexPath) -> UITableViewCell?{
        return nil
    }
}
