//
// SuccessViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class SuccessViewController: UIViewController {

    var willDismiss: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchAt(button: UIButton) {
        willDismiss?()
        dismiss(animated: true, completion: nil)
    }

}
