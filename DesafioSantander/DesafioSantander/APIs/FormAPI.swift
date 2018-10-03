//
//  BeerListRemoteDataManager.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2018 FeLima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol FormAPIProtocol{
    func fetch(completion: @escaping (FormModal) -> Void)
    func fetch()
    var delegate: FormAPIDelegate? { get set }
}

protocol FormAPIDelegate{
    func formAPI(formAPI: FormAPIProtocol, didFetchForm form: FormModal)
}

class FormAPI: FormAPIProtocol{
    var delegate: FormAPIDelegate?
    
    func fetch(completion: @escaping (FormModal) -> Void) {
        Alamofire
            .request(Endpoints.cell.cell.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<FormModal>) in
                switch response.result {
                case .success(let cells):
                    print("==========> SAIDA")
                    print(cells)
                    completion(cells)
                    
                case .failure( _):
                    let cell = FormModal(cells: [])
                    completion(cell)
                }
            })
    }
    
    func fetch() {
        Alamofire
            .request(Endpoints.cell.cell.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<FormModal>) in
                switch response.result {
                case .success(let cells):
                    print("==========> SAIDA")
                    print(cells)
                    self.delegate?.formAPI(formAPI: self, didFetchForm: cells)
                    
                case .failure( _):
                    let cell = FormModal(cells: [])
                    self.delegate?.formAPI(formAPI: self, didFetchForm: cell)
                }
            })
    }
}

