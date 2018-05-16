//
//  BaseViewController.swift
//  ShareKNX
//
//  Created by Daniel Reis on 05/09/17.
//  Copyright © 2017 MadeinWeb. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class BaseViewController: UIViewController {
    
    lazy var index: Int = 0
    
    var banner: NotificationBanner?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(baseKeyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(baseKeyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // swiftlint:disable notification_center_detachment
        NotificationCenter.default.removeObserver(self)
    }
    
    func loading(_ loading: Bool) {
        
    }
    
    func error(_ title: String?, _ error: String) {
        guard banner == nil || banner?.bannerQueue.numberOfBanners == 0 else { return }
        
        banner = NotificationBanner(title: title ?? "", subtitle: error, style: .danger)
        banner?.duration = 2
        banner?.show()
    }
    
    @objc private func baseKeyboardWillShow(notification: NSNotification) {
        keyboardWillShowIfNeeded(notification)
    }

    func keyboardWillShowIfNeeded(_ notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) ?? TimeInterval(0.3)
        
        self.keyboardWillShow(frame: keyboardFrame, duration: animationDuration)
    }
    
    func keyboardWillShow(frame: CGRect, duration: TimeInterval) {
        let distance = distanceFromKeyboard(frame: frame)
        
        UIView.animate(withDuration: duration) { [weak self] in
            if distance > 0 {
                self?.view.frame.origin.y = -distance
            } else {
                self?.view.frame.origin.y = 0
            }
        }
    }
    
    @objc private func baseKeyboardWillHide(notification: NSNotification) {
        keyboardWillHideIfNeeded(notification)
        
        view.endEditing(true)
    }
    
    func keyboardWillHideIfNeeded(_ notification: NSNotification) {
        let animationDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) ?? TimeInterval(0.3)
        
        keyboardWillHide(duration: animationDuration)
    }
    
    func keyboardWillHide(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.view.frame.origin.y = 0
        }
    }
    
    private func distanceFromKeyboard(frame: CGRect) -> CGFloat {
        guard let responderView = view.currentFirstResponder,
            let responderFrame = responderView.superview?.convert(responderView.frame, to: view) else { return 0 }
        
        var responderHeight = (responderFrame.origin.y + responderFrame.height)
        
        if responderView.superview != view, let scrollView = responderView.firstScrollView, let scrollviewFrame = scrollView.superview?.convert(scrollView.frame, to: view) {
            let scrollViewHeight = (scrollviewFrame.origin.y + scrollviewFrame.height)

            if responderHeight > scrollViewHeight {
                responderHeight -= (responderHeight - scrollViewHeight) - 10
            }
        }

        let invertedKeyboardHeight = view.frame.height - frame.height
        
        return responderHeight - invertedKeyboardHeight + 10
    }
}
