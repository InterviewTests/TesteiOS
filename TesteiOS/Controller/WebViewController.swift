//
//  WebViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 17/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var webView: WKWebView!
    
    //Properties
    var pageUrl = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        
        if self.pageUrl != ""
        {
            let url = URL(string: self.pageUrl)
            let request = URLRequest(url: url!)
            self.webView.load(request)
        }
    }
    
    @IBAction func singout(_ sender: Button)
    {
        dismiss(animated: true, completion: nil)
    }
}

extension WebViewController: WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        print("Loading...")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        print("Finish.")
    }
}
