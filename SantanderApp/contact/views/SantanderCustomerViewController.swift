    //
//  SantanderCustomerViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 25/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import SnapKit
import SwiftValidators
import Toast_Swift
    

class SantanderCustomerViewController: UIViewController {
    
    @IBOutlet var stSignView: SantanderSignupView!
    
    var cells: Cells?
    var presenter: SantanderPresenter?
    
    var phoneView : SantanderPhoneTextField?
    var mailView: SantanderEmailTypeField?
    var textView: SantanderNameTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        SantanderPresenter.sharedManager.fetchedCells(completion: { (cells, error) in
            self.cells = cells
            self.startStackFormView()
        })
        
    }
    
    private func startStackFormView(){
        
        let data = (self.cells?.data)!
        for cell in data{
        
            self.createView(formCell: cell)
            
        }
    }
    
    @IBAction func didTouchSignupEmail(_ sender: Any) {
       
        if (self.stSignView.signed){
            self.stSignView.stackViewRemove(tag: 4)
            return
        }
        
        let data = (self.cells?.data)!
        
        for cell in data{
            if(cell.id == 4){
                self.createEmailForm(formCell: cell)
                break;
            }
        }
    }
    
    @IBAction func didTouchSend(_ sender: Any) {
        
        if(self.isValid()){
            let finished = SantanderRouter.instanceFinishedViewController()
            self.present(finished, animated: false, completion: nil)
        }else{
            var style = ToastStyle()
            
            // this is just one of many style options
            style.messageColor = .red
            style.backgroundColor = .white
            self.stSignView.makeToast("Preencha os campos Nome e telefone antes de enviar", duration: 3.0, position: .top, style: style)

        }
    }
    
    private func isValid()->Bool{
        if((self.phoneView?.isValid)! && (self.textView?.isValid)!){
            
            return true
        }
        return false
    }
    @IBAction func didTouchInvestment(_ sender: Any) {
        
//        let fundViewController = SantanderRouter.instanceSantanderFundViewController()
//        
//        self.present(fundViewController, animated: false, completion: nil)
    }
    
}




