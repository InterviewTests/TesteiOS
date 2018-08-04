//
//  FormViewController.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //    MARK: - Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    //    MARK: - Setup
    func setup(){
        
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    //    MARK: - View Config
    func configTableView(){
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
//        UINib(nibName: "", bundle: nil)
    }
}
