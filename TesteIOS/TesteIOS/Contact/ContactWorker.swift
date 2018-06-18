//
//  ContactWorker.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//


import UIKit

typealias FormResponse = (_ response: Contact.Fetch.Response) -> ()

class ContactWorker {
    let manager = ApiManager()
    
    func fetchForm(url: String, success: (@escaping FormResponse), failure:(@escaping FormResponse)) {
        manager.fetchCells(stringUrl: url, success: { (data, error) in
            guard data != nil && error == nil else {
                failure(Contact.Fetch.Response(cells: nil, error: error!, message: ErrorMessenger.connectError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let formData = try decoder.decode(CellRoot.self, from: data!)
                success(Contact.Fetch.Response(cells: formData.cells, error: nil, message: ""))
            } catch let err {
                failure(Contact.Fetch.Response(cells: nil, error: err, message: ErrorMessenger.fetchError))
            }
        }, failure: { (data, error) in
            failure(Contact.Fetch.Response(cells: nil, error: error!, message: ErrorMessenger.connectError))
            return
        })
    }
}
