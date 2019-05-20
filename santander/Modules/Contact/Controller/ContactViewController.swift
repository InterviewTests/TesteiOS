//
//  ContactViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    public weak var delegate: (Contacting)?
    private var contactView: ContactView
    
    init() {
        contactView = ContactView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contactView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contato"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contactView.sendButton.isRounded = true
    }
    
}
