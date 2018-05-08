//
//  BaseView.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
protocol BaseView {
    var activityData:ActivityData {get}
    
    func showLoading()
    func hideLoading()
    func showDefaultError()
    func showError(withMessage message:String)
    
    
}

extension UIViewController:BaseView{
    
    var activityData: ActivityData {
        return ActivityData()
    }
    
    func showLoading(){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
    }
    
    func hideLoading(){
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    func showDefaultError(){
        self.showSimpleAlert(title: "Ops!", message: "Ocorreu um erro, por favor tente novamente", viewController: self, completion: nil)
    }
    func showError(withMessage message:String){
        self.showSimpleAlert(title: "Ops!", message: message, viewController: self, completion: nil)
    }
    
}

extension UIViewController{
    
    func showSimpleAlert (title:String, message:String, viewController: UIViewController, completion:((UIAlertAction) -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //        alert.addAction(UIAlertAction(title: "CANCELAR", style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: completion))
        
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
