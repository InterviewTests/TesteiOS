//
//  SuccessView.swift
//  TesteiOS
//
//  Created by Macbook on 10/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit

protocol SuccessViewDelegate : class {
    func btnSendNewMessageTapped(_ tag: Int)
}

class SuccessView: UIView {

    weak var successViewDelegate : SuccessViewDelegate!
    
    @IBAction func btnSendNewMessageTapped(_ sender: UIButton) {
        successViewDelegate.btnSendNewMessageTapped(sender.tag)
    }
}
