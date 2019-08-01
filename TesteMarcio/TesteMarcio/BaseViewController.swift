//
//  ViewControllerExtension.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit
import IJProgressView

class BaseViewController: UIViewController {
    
    var configurator: ConfiguratorProtocol?
    var scrollViewToAvoidance = UIScrollView()
    let progressView = ProgressView()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, configurator: ConfiguratorProtocol) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.configurator = configurator
        self.configurator?.config(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setKeyboardAvoidance(scrollView: UIScrollView) {
        scrollViewToAvoidance = scrollView
        scrollView.keyboardDismissMode = .interactive
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowWithNotification), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideWithNotification), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShowWithNotification(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let bottomInset = keyboardFrame.height != 0 ? keyboardFrame.height + 20 : 0
        
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.scrollViewToAvoidance.contentInset = UIEdgeInsets(top: self.scrollViewToAvoidance.contentInset.top,
                                                                   left: self.scrollViewToAvoidance.contentInset.left,
                                                                   bottom: bottomInset,
                                                                   right: self.scrollViewToAvoidance.contentInset.right)
        })
    }
    @objc func keyboardWillHideWithNotification(notification: NSNotification) {
        
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.scrollViewToAvoidance.contentInset = UIEdgeInsets(top: self.scrollViewToAvoidance.contentInset.top,
                                                                   left: self.scrollViewToAvoidance.contentInset.left,
                                                                   bottom: 0,
                                                                   right: self.scrollViewToAvoidance.contentInset.right)
        })
    }
    
    func showActivityIndicator() {
       
        progressView.showProgressView()
    }
    
    func hideActivityIndicator() {
        progressView.hideProgressView()
    }
    
}



