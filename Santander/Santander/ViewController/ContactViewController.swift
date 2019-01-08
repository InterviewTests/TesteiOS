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
        
        _view.tableView.delegate   = self
        _view.tableView.dataSource = self
        _view.buttonNewMessage.addTarget(self, action: #selector(returnToContactFormAction), for: UIControl.Event.touchUpInside)
        
        presenter.bindTo(view: self)
        presenter.requestForm()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.destroy()
    }
    
    ///
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
                cell?.setupCell(item, callback: { [unowned self] (isSelected, item) in
                    self.presenter.onSwitchSelected(isSelected, item)
                })
                return cell
            case .send:
                let cell = _view.tableView.getCell(indexPath, UIButtonCell.self)
                cell?.setupCell(item, callback: { [unowned self] in
                    self.presenter.sendContact()
                })
                return cell
            default:
                return nil
        }
    }
}

extension ContactViewController: ContactViewDelegate {

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
