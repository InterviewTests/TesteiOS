//
//  FormViewController.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 08/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var fullName: UITextField!
    @IBOutlet var fullNameIndicator: UIView!
    @IBOutlet var email: UITextField!
    @IBOutlet var emailIndicator: UIView!
    @IBOutlet var phone: UITextField!
    @IBOutlet var phoneIndicator: UIView!
    @IBOutlet var registerEmail: UIView!
    @IBOutlet var registerEmailText: UILabel!
    @IBOutlet var sendButton: UIButton!
    
    var registerEmailSign = false
    
    var cells = Cells()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configRegisterEmail()
        
        CellsAPI.getAllFormCells { (cells, success) in
            if success {
                guard let cells = cells else { return }
                self.cells = cells
                self.commonMetadata()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Common metadata
    func commonMetadata() {
        fullName.placeholder = cells.getCell(identifier: .Name)?.message
        email.placeholder = cells.getCell(identifier: .Email)?.message
        phone.placeholder = cells.getCell(identifier: .Phone)?.message
        registerEmailText.text = cells.getCell(identifier: .RegisterEmail)?.message
        sendButton.setTitle(cells.getCell(identifier: .Send)?.message, for: .normal)
    }
    
    
    //MARK: - Register email button
    @objc func registerEmailAction(_ recognizer: UITapGestureRecognizer) {
        checkSwitch()
    }
    
    fileprivate func checkSwitch() {
        if registerEmailSign {
            registerEmailSign = false
            registerEmail.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            registerEmailSign = true
            registerEmail.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
        }
    }
    
    fileprivate func configRegisterEmail() {
        registerEmail.layer.borderWidth = 2
        registerEmail.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).cgColor
        let registerEmailTap = UITapGestureRecognizer(target: self, action: #selector(self.registerEmailAction(_:)))
        let registerEmailTapLabel = UITapGestureRecognizer(target: self, action: #selector(self.registerEmailAction(_:)))
        registerEmail.addGestureRecognizer(registerEmailTap)
        registerEmailText.addGestureRecognizer(registerEmailTapLabel)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension FormViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == email {
            if (textField.text?.contains("@"))! {
                emailIndicator.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else {
                emailIndicator.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
            }
        }
        return true
    }
}
