//
//  InvestWorker.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 27/09/19.
//  Copyright (c) 2019 Luiz Otavio Processo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class InvestWorker{
    
  func getInvestInfo(completionHandler: @escaping (InvestViewInfo) -> Void ){
    
    let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
    let task = URLSession.shared.dataTask(with: url!){(data,response, error) in
        DispatchQueue.main.async{
            if let data = data{
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(InvestViewInfo.self, from: data)
                    print(decodedData)
                    completionHandler(decodedData)
                }catch{
                    print(error)
                    print(error.localizedDescription)
                }
            }
        }
    }
    task.resume()
  }
}
