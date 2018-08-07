//
//  SafariViewControllerProtocol.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import SafariServices

protocol SafariViewControllerProtocol: NSObjectProtocol {
    func openSafariView(at url: String)
}

extension SafariViewControllerProtocol where Self: UIViewController {
    func openSafariView(at url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVc = SFSafariViewController(url: url)
        present(safariVc, animated: true, completion: nil)
    }
}
