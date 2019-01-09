//
//  ProductViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit
import SafariServices

class ProductViewController: BaseViewController {
    
    private unowned var _view:ProductView { return self.view as! ProductView }
    private var presenter:ProductPresenter = ProductPresenter()
    
    override func loadView() {
        self.view = ProductView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Investimentos"
        
        _view.tableView.delegate   = self
        _view.tableView.dataSource = self

        presenter.bindTo(view: self)
        presenter.requestInfo()
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getInfoCellFor(indexPath) ?? UITableViewCell()
    }
    
    /// Returns an UITableViewCell according to the section of the UITableView
    private func getInfoCellFor(_ indexPath: IndexPath) -> UITableViewCell?{
        switch indexPath.section {
            case 0:
                let cell = _view.tableView.getCell(indexPath, HeaderCell.self)
                cell?.setupHeader(for: presenter.screen)
                return cell
            case 1:
                let item = presenter.profitabilityForRow(indexPath.row)
                let cell = _view.tableView.getCell(indexPath, MoreInfoDoubleCell.self)
                cell?.setupCell(for: indexPath.row, profitability: item)
                return cell
            case 2:
                let item = presenter.infoForRow(indexPath.row)
                let cell = _view.tableView.getCell(indexPath, MoreInfoSingleCell.self)
                cell?.setupCell(for: item)
                return cell
            case 3:
                let item = presenter.downInfoForRow(indexPath.row)
                let cell = _view.tableView.getCell(indexPath, DownloadCell.self)
                cell?.setupCell(for: item, callback: { [weak self] in
                    self?.presenter.download()
                })
                return cell
            case 4:
                let cell = _view.tableView.getCell(indexPath, UIButtonCell.self)
                cell?.setCallback({ [weak self] in
                    self?.presenter.invest()
                })
                return cell
            default:
                return nil
        }
    }
}

extension ProductViewController: ProductViewDelegate, SFSafariViewControllerDelegate {
    
    func displayPopup(title: String, message: String) {
        showAlert(title: title, message: message)
    }
    
    func openWebView(site: String) {
        if let url = URL(string: site) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
    func updateTableViewItems() {
        _view.tableView.reloadData()
        _view.tableView.isHidden = false
    }
}
