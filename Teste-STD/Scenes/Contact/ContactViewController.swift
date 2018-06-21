//
//  ViewController.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 21/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit
import Material
import XLPagerTabStrip
class ContactViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var txtName: TextField!
    @IBOutlet weak var txtEmail: TextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtPhone: TextField!
    var router: ContactRouter!
    @IBOutlet weak var btnCheck: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        txtEmail.delegate = self
        txtPhone.delegate = self
        btnSend.addTarget(self, action: #selector(sendData), for: UIControlEvents.touchUpInside)
        btnCheck.addTarget(self, action: #selector(check), for: .touchUpInside)
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let _ = self.view
         ContactConfigurator.sharedInstance.configure(viewController: self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        
        if textField == txtEmail{
            if !validEmail(string: string){
                txtEmail.dividerColor = UIColor.red
            }else{
                txtEmail.dividerColor = UIColor.green
            }
        }
        var groupSize = 3
        var secondaryGroup = 4
        var count = 12
        var separator = "-"
        if string.characters.count == 0 {
            groupSize = 4
        }
        let formatter = NumberFormatter()
        formatter.groupingSeparator = separator
        formatter.groupingSize = groupSize
        formatter.usesGroupingSeparator = true
        formatter.secondaryGroupingSize = 4
        if textField == txtPhone{
            if var number = textField.text, string != "" {
                if(textField.text!.count == 12 && string != ""){
                    secondaryGroup = 5
                    count += 1
            }
            number = number.replacingOccurrences(of: separator, with: "")
            if let doubleVal = Double(number) {
                formatter.secondaryGroupingSize = secondaryGroup
                let requiredString = formatter.string(from: NSNumber.init(value: doubleVal))
                if (!(newLength <= count)) {
                    return false
                }
                    textField.text = requiredString
                }
        }
    }
        return true
    }
    
    func isEmpty(){
        
        if (txtName.text?.isEmpty)!{
            txtName.becomeFirstResponder()
            txtName.dividerColor = UIColor.red
            return
        }
        if !validEmail(string: ""){
            txtEmail.becomeFirstResponder()
            txtEmail.dividerColor = UIColor.red
            return
        }
        if (txtPhone.text?.isEmpty)! || ((txtPhone.text?.count)! < 12){
            txtPhone.becomeFirstResponder()
            txtPhone.dividerColor = UIColor.red
            return
        }
        
        router.showSucess()
    }
    
    func validEmail(string: String?)->Bool {
       
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: "\(txtEmail.text! + string!)")

    }
    
   @objc func sendData(_ sender: Any) {
        isEmpty()
    }
    @objc func check(_ sender: Any) {
        var image:UIImage
        if btnCheck.isSelected {
            btnCheck.isSelected = false
        }else{
            btnCheck.isSelected = true
        }
    }
    
    @IBAction func unwindToContact(segue:UIStoryboardSegue) { }
}
extension ContactViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Contato")
    }
}

