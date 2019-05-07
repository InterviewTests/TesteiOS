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
}

protocol  FormInteractorOutput: class {
    func resultForm(cellList:[CellList])
    func failure(msg:String)
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
    
}
