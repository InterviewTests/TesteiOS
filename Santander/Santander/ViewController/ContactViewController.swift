//
//  ContactViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class ContactViewController: BaseViewController {
    
    private unowned var _view:ContactView { return self.view as! ContactView }
    private var presenter:ContactPresenter = ContactPresenter()
    
    override func loadView() {
        self.view = ContactView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contato"
        dismissKeyboard()
        
        _view.tableView.delegate   = self
        _view.tableView.dataSource = self
        _view.buttonNewMessage.addTarget(self, action: #selector(returnToContactFormAction), for: UIControl.Event.touchUpInside)
        
        presenter.bindTo(view: self)
        presenter.requestForm()
    }
    
    /// Configures the view to dismiss the keyboard on click
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAction))
        tap.cancelsTouchesInView = false
        _view.addGestureRecognizer(tap)
    }
    
    /// Dismiss the keyboard
    @objc private func dismissKeyboardAction(){
        _view.endEditing(true)
    }
    
    /// Action to display the contact form
    @objc func returnToContactFormAction(){
        presenter.returnToContactForm()
    }
}

extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getInfoCellFor(indexPath) ?? UITableViewCell()
    }
    
    /// Returns an UITableViewCell according to the model type
    private func getInfoCellFor(_ indexPath: IndexPath) -> UITableViewCell?{
        
        let item = presenter.itemForRow(indexPath.row)
        switch item.type {
            case .field:
                let cell = _view.tableView.getCell(indexPath, UITextFieldCell.self)
                cell?.setupCell(item)
                return cell
            case .text:
                let cell = _view.tableView.getCell(indexPath, UILabelCell.self)
                cell?.setupCell(item)
                return cell
            case .checkbox:
                let cell = _view.tableView.getCell(indexPath, UICheckBoxCell.self)
                cell?.setupCell(item, callback: { [weak self] (isSelected, item) in
                    self?.presenter.onSwitchSelected(isSelected, item)
                })
                return cell
            case .send:
                let cell = _view.tableView.getCell(indexPath, UIButtonCell.self)
                cell?.setupCell(item, callback: { [weak self] in
                    self?.presenter.sendContact()
                })
                return cell
            default:
                return nil
        }
    }
}

extension ContactViewController: ContactViewDelegate {
    
    func displayPopup(title: String, message: String) {
        showAlert(title: title, message: message)
    }

    func updateTableViewItems(items: [FormItem]) {
        _view.tableView.reloadData()
    }
    
    func showSuccessPage() {
        _view.tableView.isHidden = true
    }
    
    func hideSuccessPage() {
        _view.tableView.isHidden = false
    }
}
