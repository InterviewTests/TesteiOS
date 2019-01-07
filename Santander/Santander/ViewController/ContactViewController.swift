//
//  ContactViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    private unowned var _view:ContactView { return self.view as! ContactView }
    
    private var formItems:[FormItem] = []
    private var presenter:ContactPresenter!
    
    override func loadView() {
        self.view = ContactView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ContactPresenter(bindTo: _view)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.destroy()
    }
}

extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
