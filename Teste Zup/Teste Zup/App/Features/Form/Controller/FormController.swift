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
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    fileprivate func bindViewModel() {
        formViewModel.fetchForm { (form) in
            self.formViewModel.form = form
            self.formViewModel.definePresentation()
        }
    }
}
