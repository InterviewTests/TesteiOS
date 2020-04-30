//
//  ContactFormResultViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit
protocol ContactFormResultProtocol {
    func sendNewMessage()
}

class ContactFormResultViewController: UIViewController {
    var delegate: ContactFormResultProtocol?
    
    // MARK: - Actions
    @IBAction func sendNewMessage(_ sender: Any) {
        delegate?.sendNewMessage()
    }
}
