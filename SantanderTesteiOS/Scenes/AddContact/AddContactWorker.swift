//
//  AddContactWorker.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

typealias AddContactWorkerCellsHandler = ([Cell]) -> Swift.Void
typealias AddContactWorkerCellsFailure  = (NSError)-> Swift.Void


class AddContactWorker: NSObject {
    
    func fetchCells(completion : @escaping AddContactWorkerCellsHandler, failure : @escaping AddContactWorkerCellsFailure) {
        let requestable = AddContactWorkerRequestable(request: AddContactModels.Cells.Request())
        let request     : HTTRequest<AddContactCell> = HTTRequest(requestable: requestable)
        request.get(success: { response in
            guard let cell = response else {
                failure(NSError.generic)
                return
            }
            completion(cell.cells)
        }, failure: { error in
            failure(error)
        })
    }
}

struct AddContactWorkerRequestable : HTTPRequestable {
    
    var request : AddContactModels.Cells.Request
    
    var url: URL {
        return URL(string: environment.host + path)!
    }
    
    var path: String {
        return "cells.json"
    }
    
    var params: [String : Any] {
        return [:]
    }
}
