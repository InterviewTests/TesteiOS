//
//  FundsViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsViewController: UIViewController {
    
    public var dataSource: TableViewDataSource?
    public weak var delegate: (Funding & Contacting & Browsing)?
    
    internal var fundsView: FundsView
    
    init() {
        self.fundsView = FundsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        super.loadView()
        self.view = fundsView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        
        let shareBarItem =
            UIBarButtonItem(image: Resource.Image.share.image,
                            style: .plain,
                            target: self, action: #selector(didShareSelected))
        
        navigationItem.rightBarButtonItem = shareBarItem
    }
    
}

extension FundsViewController {
    
    @objc
    func didShareSelected() {
        // TODO: Implment share bar button action
    }
    
}
