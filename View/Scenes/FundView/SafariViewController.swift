//
//  SafariViewController.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 24/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit


class SafariViewController: UIViewController {
    
    @IBOutlet weak var erroLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var url: URL? = URL(string: "https://www.google.com.br")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // theming
        let theme = ThemeManager.current()
        loadingIndicator.color = theme.primaryColor
        erroLabel.font = theme.tabTextFont
        
        // view setup
        webView.delegate = self
        erroLabel.isHidden = true
        
        // open URL
        loadURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !erroLabel.isHidden {
            erroLabel.isHidden = true
            loadURL()
        }
    }
    
    private func loadURL() {
        if let unwrappedURL = url {
            let request = URLRequest(url: unwrappedURL)
            self.webView.loadRequest(request)
        } else {
            self.showErrorMessage("URL não encontrada.")
        }
    }
    
    private func showErrorMessage(_ error: String) {
        erroLabel.text = error
        erroLabel.isHidden = false
    }
}


extension SafariViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.loadingIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.loadingIndicator.stopAnimating()
        self.showErrorMessage(error.localizedDescription)
    }
    
}
