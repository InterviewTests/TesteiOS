//
//  DetailRouter.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import SafariServices

protocol DetailRouterProtocol:class {
    func routerToSafari()
}

class DetailRouter:DetailRouterProtocol {
    
    var VC:DetailViewController!
    
    func routerToSafari() {
        
        if let url = URL(string: "https://www.google.com") {
            if #available(iOS 11.0, *) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                
                let view = SFSafariViewController(url: url, configuration: config)
                self.VC?.present(view, animated: true, completion: nil)
            }else if #available(iOS 10.0, *){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.openURL(url)
            }
        }        
    }
    
}
