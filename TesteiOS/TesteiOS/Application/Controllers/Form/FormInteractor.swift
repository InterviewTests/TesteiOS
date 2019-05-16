//
//  FormInteractor.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol FormInteractorInput: class {
    func loadForm()
    func validateFields(arr:[ValidateValues])
}

protocol  FormInteractorOutput: class {
    func resultForm(cellList:[CellList])
    func failure(msg:String)
    func validateSuccess()
}

class FormInteracor: NSObject, FormInteractorInput {
    
    private(set) var presenter : FormPresenter
    private(set) var wireframe : FormWireframe
    
    weak var presentOutput: FormInteractorOutput?
    
    init(presenter:FormPresenter, wireframe:FormWireframe) {
        self.presenter = presenter
        self.wireframe = wireframe
    }
    
    private lazy var provider : FormProvider = {
        return FormProvider.init()
    }()
    
    //MARK: FormInteractorInput
    func loadForm() {
        self.provider.getCellForm { (cell, error) in
            guard error == nil else {
                self.presentOutput?.failure(msg: error!.localizedDescription)
                return
            }
            
            if let cell = cell, let listCell = cell.cellsList  {
                self.presentOutput?.resultForm(cellList: listCell)
            }
            
        }
    }
    
    func validateFields(arr:[ValidateValues]) {
        
        let arrEmail = arr.filter({ $0.type == TypeField.email })
        if arrEmail.count > 0 {
            let validator = Validator(typefield: TypeField(rawValue: (arrEmail.last?.type.hashValue)!))
            
            if !validator.validateEmail(email: arrEmail.last!.value) {
                self.presentOutput?.failure(msg: "Campo e-mail incorreto!")
                return
            }
        }else{
            self.presentOutput?.failure(msg: "Por favor preencha o campo e-mail.")
            return
        }
        
        let arrPhone = arr.filter({ $0.type == TypeField.telNumber })
        if arrPhone.count > 0 {
            
            let validator = Validator(typefield: arrPhone.last!.type)
            if !validator.validatePhone(phone: arrPhone.last!.value) {
                self.presentOutput?.failure(msg: "Campo Telefone incorreto!")
                return
            }
            
        }else{
            self.presentOutput?.failure(msg: "Por favor preencha o campo Telefone.")
            return
        }
        
        
        let arrText  = arr.filter({ $0.type == TypeField.text })
        if arrText.count > 0 {
            let validator = Validator(typefield: arrText.last!.type)
            if !validator.validate(arrText.last!.value) {
                self.presentOutput?.failure(msg: "Campo Nome incorreto!.")
                return
            }
        }else{
            self.presentOutput?.failure(msg: "Por favor preencha o campo Nome.")
            return
        }
        
        self.presentOutput?.validateSuccess()
        
    }
    
}
