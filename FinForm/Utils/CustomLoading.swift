//
//  CustomLoading.swift
//  FinForm
//
//  Created by Gustavo on 25/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class CustomLoading{
    
    let indicatorView:UIActivityIndicatorView!
    
    init(view:UIView){
        
        let indicatorWidth:CGFloat = 50.00
        
        indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicatorView.frame = CGRect(x: 0, y: 0, width: indicatorWidth, height: indicatorWidth)
        indicatorView.center = view.center
        view.addSubview(indicatorView)
        view.bringSubview(toFront: indicatorView)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func show(){
        if indicatorView != nil{
            indicatorView.startAnimating()
        }
    }
    
    func hide(){
        if indicatorView != nil{
            DispatchQueue.main.async {
                self.indicatorView.stopAnimating()
            }
        }
    }
    
}
