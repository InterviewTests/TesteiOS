//
//  ViewController.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 29/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vSelected: UIView!
    @IBOutlet weak var constrVSelectedLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func investmentPressed(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @IBAction func contactPressed(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percentage = scrollView.contentOffset.x / (scrollView.contentSize.width / 2)
        constrVSelectedLeading.constant = percentage * vSelected.frame.size.width
    }
}

