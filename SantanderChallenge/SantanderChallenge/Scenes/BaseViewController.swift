//
// BaseViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.color = Colors.selectedRed
        activity.hidesWhenStopped = true
        
        view.addSubview(activity)
        activity.center = view.center
        
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startLoading() {
        view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }

}
