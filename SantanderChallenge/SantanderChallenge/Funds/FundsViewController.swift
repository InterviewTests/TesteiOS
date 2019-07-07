//
// FundsViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

protocol FundsPresentableProtocol: AnyObject {
    func displayFunds(_ cells: [FundContentData])
    func displayError(_ error: String)
}

class FundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var interactor: FundsInteractor?
    fileprivate var cells: [FundContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInteractor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.fetchFunds()
    }
    
    private func setupTableView() {
        // Register cells
        
        tableView.tableFooterView = UIViewController.blankView
    }
    
    private func setupInteractor() {
        let presenter = FundsPresenter(view: self)
        interactor = FundsInteractor(presenter: presenter)
    }
}

extension FundsViewController: FundsPresentableProtocol {
    
    func displayFunds(_ cells: [FundContentData]) {
        self.cells = cells
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        func displayError(_ error: String) {
            let alert = UIAlertController(title: "🤨", message: error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
}

extension FundsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
                return cell
            }
            return UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }()
        cell.textLabel?.text = "\(cells[indexPath.row])"
        return cell
    }
    
    
}

extension FundsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


