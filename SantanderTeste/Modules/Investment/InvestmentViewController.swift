//
//  InvestmentViewController.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit
import SafariServices

class InvestmentViewController: BaseViewController {
    
    var presenter: InvestmentPresenter?
    
    @IBOutlet weak var tableView: UITableView?
    
    var fund: Fund?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        presenter?.loadUIIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    // MARK: Custom
    
    func setTableView() {
        tableView?.dataSource = self
        
        tableView?.separatorStyle = .none
        tableView?.tableHeaderView = nil
        tableView?.tableFooterView = {
            let button = CustomButton(frame: CGRect(x: 0,
                                                    y: 30,
                                                    width: tableView?.frame.width ?? 0,
                                                    height: 60))
            button.backgroundColor = .customRedOne
            button.setTitle("Investir", for: .normal)
            button.titleLabel?.font = UIFont(name: "DINPro-Medium", size: 17) ??
                UIFont.systemFont(ofSize: 17)
            button.titleLabel?.textColor = .white
            button.layer.cornerRadius = 30
            
            let view = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: tableView?.frame.width ?? 0,
                                            height: 120))
            view.addSubview(button)
            return view
        }()
        
        tableView?.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        tableView?.register(UINib(nibName: "InvestmentHeaderCell", bundle: .main),
                            forCellReuseIdentifier: "InvestmentHeaderCell")
        tableView?.register(UINib(nibName: "InvestmentInfoCell", bundle: .main),
                            forCellReuseIdentifier: "InvestmentInfoCell")
        tableView?.register(UINib(nibName: "InvestmentDownloadCell", bundle: .main),
                            forCellReuseIdentifier: "InvestmentDownloadCell")
        
        tableView?.rowHeight = UITableViewAutomaticDimension
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.customDarkGray,
                                                            .font: UIFont(name: "DINPro-Medium", size: 17) ??
                                                                UIFont.systemFont(ofSize: 17)]
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "ic_redUpload"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: button)]
    }
}

extension InvestmentViewController: InvestmentPresenterDelegate {
    // MARK: InvestmentPresenterDelegate
    
    func loadUI(_ fund: Fund) {
        self.fund = fund
        
        tableView?.reloadData()
    }
}

extension InvestmentViewController: UITableViewDataSource {
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return fund?.info?.count ?? 0
        default:
            return fund?.downInfo?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentHeaderCell", for: indexPath)
                as? InvestmentHeaderCell else { return UITableViewCell() }
            
            if let fund = fund { cell.loadUI(fund) }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentInfoCell", for: indexPath)
                as? InvestmentInfoCell else { return UITableViewCell() }
            
            if let info = fund?.info?[indexPath.row] { cell.loadUI(info) }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentDownloadCell", for: indexPath)
                as? InvestmentDownloadCell else { return UITableViewCell() }
            
            cell.onDownloadPressed = { [weak self] in
                guard let url = URL(string: "http://www.google.com") else { return }
                
                let controller = SFSafariViewController(url: url)
                controller.delegate = self
                
                self?.present(controller, animated: true, completion: nil)
            }
            
            if let info = fund?.info?[indexPath.row] { cell.loadUI(info) }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension InvestmentViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
