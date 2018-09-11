//
//  FormMemStore.swift
//  DesafioSantander
//
//  Created by Fernanda de Lima on 04/09/2018.
//  Copyright © 2018 FeLima. All rights reserved.
//

import Foundation
var cellAux:[cellStruct] = []

class FormMemStore: FormStoreProtocol{
    
    var form = FormModal(cells: cellAux)
    var api = CellAPI()
    
    func fetchForms(completionHandler: @escaping (FormModal, Error?) -> Void) {
        api.fetchForms { (form, error) in
            completionHandler(form,nil)
        }
    }
    
}
