//
//  FormWorker.swift
//  TesteIOS
//
//  Created by Sidney Silva on 09/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

typealias FormResponse = (_ response: FormModel.Fetch.Response) -> ()

class FormWorker: NSObject {
    let manager = ApiManager()
    
    func fetchForm(success: (@escaping FormResponse), failure:(@escaping FormResponse)) {
        manager.fetchCells(stringUrl: Url.formUrl) { (data, error) in
            guard let data = data else {
                failure(FormModel.Fetch.Response(cell: [], message: "Erro ao conectar com o servidor"))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let formData = try decoder.decode(CellRoot.self, from: data)
                print(formData)
            } catch let err {
                print("Err", err)
            }
        }
    }
}
