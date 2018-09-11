//
//  CellsAPI.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 07/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import EVReflection
import Alamofire

class CellsAPI: NSObject {
    static let uri = "https://floating-mountain-50292.herokuapp.com/cells.json"
    static var alamofireManager: Alamofire.SessionManager?
    
    //MARK: - Config Alamofire
    static func configAlamofire() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 50
        configuration.allowsCellularAccess = true
        CellsAPI.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    //MARK: - Cells
    static func getAllFormCells(completionHandler: @escaping ((_ cells: Cells?, _ success: Bool) -> ())) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        CellsAPI.configAlamofire()
        
        CellsAPI.alamofireManager?.request(uri, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject(completionHandler: { (response: DataResponse<Cells>) in
            guard let cellsResponse = response.response else { return }
            switch cellsResponse.statusCode {
            case 200:
                if let cellsObject = response.result.value {
                    completionHandler(cellsObject, true)
                }
            default:
                completionHandler(nil, false)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }
}
