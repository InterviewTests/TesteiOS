//
//  BeerListRemoteDataManager.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class CellAPI: FormStoreProtocol{
    func fetchForms(completionHandler: @escaping (FormModal, Error?) -> Void) {
        Alamofire
            .request(Endpoints.cell.cell.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<FormModal>) in
                switch response.result {
                case .success(let cells):
                    print("==========> SAIDA")
                    print(cells)
                    completionHandler(cells, nil)
                    
                case .failure( _): break
//                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
    
}
