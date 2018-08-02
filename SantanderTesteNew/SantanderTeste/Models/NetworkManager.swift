//
//  NetworkManager.swift
//  SantanderTeste
//
//  Created by Danilo Henrique on 20/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
var dataCell: RootCell!
var dataScreen: Root!
class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request_Contato(_ completionHanlder: @escaping ()-> Void){
        Alamofire.request("https://floating-mountain-50292.herokuapp.com/cells.json").responseJSON { (response) in
            let data = response.data!
    
            do {
                
                let r = try JSONDecoder().decode(RootCell.self, from: data)
                dataCell = r
                completionHanlder()
                
            }catch let error{
                print(error)
                return
            }
        }
    }
    
    func request_Investimento(_ completionHanlder: @escaping ()-> Void){
        Alamofire.request("https://floating-mountain-50292.herokuapp.com/fund.json").responseJSON { (response) in
            let data = response.data!
       
            do {
                let r = try JSONDecoder().decode(Root.self, from: data)
                dataScreen = r
                completionHanlder()
                // print(r.screen)
            }catch let error{
                print(error)
            }
        }
    }
}
