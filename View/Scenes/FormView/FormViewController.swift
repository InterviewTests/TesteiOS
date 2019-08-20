//
//  FormViewController.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 14/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit

class FormViewController: UITableViewController {
    
    var presenter: FormViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        presenter.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell & FormViewCell
        
        let type = presenter.getRowType(at: indexPath.row)
        switch type {
        case .image: cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageViewCell
        case .text: cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TextViewCell
        case .checkbox: cell = tableView.dequeueReusableCell(withIdentifier: "checkboxCell", for: indexPath) as! CheckBoxViewCell
        case .field: cell = tableView.dequeueReusableCell(withIdentifier: "fieldCell", for: indexPath) as! FieldViewCell
        case .send: cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonViewCell
        }
        
        cell.prepareForReuse()
        presenter.configure(cell: cell, at: indexPath.row)
        return cell
    }
    
    // MARK: Tap Gesture Dismiss Keyboard
    @IBAction func viewTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    // MARK: unwind Segue
    @IBAction func unwindToFormViewController(segue:UIStoryboardSegue) {
        presenter.clearUserInput()
        refresh()
    }
    
}


// MARK: FormView
extension FormViewController: FormView {
    
    func refresh() {
        tableView.reloadData()
    }

    func goToFormSentSuccesfullyPage() {
        performSegue(withIdentifier: "toFormSentSuccessfully", sender: nil)
    }

}
