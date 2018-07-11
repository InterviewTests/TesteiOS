//
//  FormController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 10/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

@objc protocol FormController: UITextFieldDelegate {
    var textFields: [UITextField] { get set }
    
    func hideID(id: Int)
    func showID(id: Int)
}
