//
//  SantanderInteractor.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import Foundation

protocol SantanderInteractorInput: class{
    func fetchCellEntity(completion: @escaping (_ cellEntity: Cells?, _ error: Error?) -> Void)
    func fetchFundScreen(completion: @escaping (_ screen: Screen?, _ error: Error?) -> Void)
}
class SantanderInteractor: SantanderInteractorInput {
    
    static let sharedManager: SantanderInteractorInput = {
        let santanderInteractor = SantanderInteractor()
        return santanderInteractor
    }()
    
    var service: SantanderServiceInterface! = SantanderService()
    
    func fetchCellEntity(completion: @escaping (_ cellEntity: Cells?, _ error: Error?) -> Void){
        
        let infoDict = service.getKeys()
        let urlCell = URL(string: infoDict.cells)!
        
        Alamofire.request(urlCell, method:.get).responseJSON { (response) in
            
            switch response.result{
            case .failure(let error):
                return
            case .success(let data):
                let swiftyJsonVar = JSON(data)
                let cells = Mapper<Cells>().map(JSONString: swiftyJsonVar.rawString()!)
                completion(cells, nil)
            }
        }
    }
    func fetchFundScreen(completion: @escaping (_ screen: Screen?, _ error: Error?) -> Void){
        let infoDict = service.getKeys()
        let urlCell = URL(string: infoDict.fund)!
        
        Alamofire.request(urlCell, method:.get).responseJSON { (response) in
            
            switch response.result{
            case .failure(let error):
                return
            case .success(let data):
                let swiftyJsonvar = JSON(data)
                let fundScreen = Mapper<Screen>().map(JSONString: swiftyJsonvar.rawString()!)
                completion(fundScreen, nil)
            }
        }
        
    }
}

