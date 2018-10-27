//
//  Extension.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 26/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {

    func checkEmail(user: String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: user)
    }
    
    func checkCPF(user: String) -> Bool{
        var success = false
        let onlyNumbers = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: user))
        if onlyNumbers && user.count == 11{
            success = true
        }
        return success
    }


    func checkPass(text: String) -> Bool{
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: text)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        
        let specialresult = texttest2.evaluate(with: text)

        
        return capitalresult && numberresult && specialresult
    }
    
}

extension UserDataViewController {
    
    func setUpHeader(headerView: UIView){
        
        headerView.backgroundColor = UIColor(red:0.97, green:0.98, blue:0.98, alpha:1.0)
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        headerLabel.textColor = UIColor(red:0.28, green:0.33, blue:0.40, alpha:1.0)
        headerLabel.text = "Recentes"
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
