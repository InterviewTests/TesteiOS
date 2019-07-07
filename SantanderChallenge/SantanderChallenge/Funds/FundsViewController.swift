//
// FundsViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class FundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var interactor: FundsInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
