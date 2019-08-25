//
//  FormController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FormController: UITableViewController{
    
    var formViewModel = FormViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        tableView.tableFooterView = UIView()
        tableView.register(FormViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    fileprivate func bindViewModel() {
        formViewModel.fetchForm { (form) in
            self.formViewModel.form = form
        }
    }
}

extension FormController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.formViewModel.form?.cells?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FormViewCell
        self.formViewModel.row = indexPath.row
        cell.formViewModel = formViewModel
        return cell
    }
}
