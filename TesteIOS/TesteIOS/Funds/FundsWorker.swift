//
//  FundsWorker.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//


import UIKit

typealias FundsRespose = (_ response: FundsModel.Fetch.Response) -> ()

class FundsWorker {
    let manager = ApiManager()
    
    func fetchForm(url: String, success: (@escaping FundsRespose), failure:(@escaping FundsRespose)) {
        manager.fetchCells(stringUrl: url, success: { (data, error) in
            guard data != nil && error == nil else {
                failure(FundsModel.Fetch.Response(screen: nil, error: error!, message: ErrorMessenger.connectError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let fundsData = try decoder.decode(FundsScreen.self, from: data!)
                success(FundsModel.Fetch.Response(screen: fundsData.screen, error: nil, message: ""))
            } catch let err {
                failure(FundsModel.Fetch.Response(screen: nil, error: err, message: ErrorMessenger.connectError))
            }
        }, failure: { (data, error) in
            failure(FundsModel.Fetch.Response(screen: nil, error: error!, message: ErrorMessenger.connectError))
            return
        })
    }
}
