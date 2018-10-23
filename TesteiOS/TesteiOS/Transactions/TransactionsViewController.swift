//
//  TransactionsViewController.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

class UserTransactionsViewController: UIViewController {
    
    let accountInformationView = UIView()
    let transactionsTableView = UITableView()
    
    @IBOutlet weak var userAccountView: UserAccountDataView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var agencyAccountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    
}
