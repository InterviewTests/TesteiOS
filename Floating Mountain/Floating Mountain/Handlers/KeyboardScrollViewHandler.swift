//
//  KeyboardScrollViewHandler.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/15/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class KeyboardScrollViewHandler: NSObject {
    
    weak var scrollView: UIScrollView?
    
    init(scrollView: UIScrollView? = nil) {
        super.init()
        self.scrollView = scrollView
    }
    
    deinit {
        unregisterForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardInfo = notification.userInfo
        let keyboardFrame = keyboardInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        if let keyboardHeight = keyboardFrame?.height, let scrollView = scrollView {
            var bottomInset = keyboardHeight
            if #available(iOS 11, *) {
                bottomInset -= scrollView.safeAreaInsets.bottom
            }
            let edgeInsets = UIEdgeInsets(top: scrollView.contentInset.top,
                                          left: scrollView.contentInset.left,
                                          bottom: bottomInset,
                                          right: scrollView.contentInset.right)
            scrollView.contentInset = edgeInsets
            scrollView.scrollIndicatorInsets = edgeInsets
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let scrollView = scrollView else { return }
        let edgeInsets = UIEdgeInsets(top: scrollView.contentInset.top,
                                      left: scrollView.contentInset.left,
                                      bottom: 0.0,
                                      right: scrollView.contentInset.right)
        scrollView.contentInset = edgeInsets
        scrollView.scrollIndicatorInsets = edgeInsets
    }
    
}

