//
//  FormViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 10/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class FormViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Form")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath)
        return cell
    }
}
