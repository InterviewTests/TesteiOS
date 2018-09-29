//
//  ContactInteractor.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol InteractorLogic {
    func fecthCellsData()
}

class ContactInteractor: InteractorLogic {
    
    var presenter: ContactPresenter?
    var worker: ContactWorker?
    
    func fecthCellsData() {
    
        let worker = ContactWorker()
        
        worker.getCellsData { (cells) in
            
            self.presenter?.presentContactScreen(response: cells!)
        }
    }
}
