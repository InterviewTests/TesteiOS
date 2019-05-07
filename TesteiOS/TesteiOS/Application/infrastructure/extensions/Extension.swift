//
//  Extension.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    func setSelectionIndicatorImage() {
        
        if let tabBar = self.tabBarController?.tabBar {
            tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.btnSend(), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineWidth: 2.0, up: true)
            
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func alertMesage(title:String, msg:String, btn:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btn, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading(){
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func hideLoading(){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
