//
//  FundsAPI.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 08/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import EVReflection
import Alamofire

class FundsAPI: NSObject {
    static let uri = "https://floating-mountain-50292.herokuapp.com/fund.json"
    static var alamofireManager: Alamofire.SessionManager?
    
    //MARK: - Config Alamofire
    static func configAlamofire() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 50
        configuration.allowsCellularAccess = true
        FundsAPI.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    //MARK: - Funds
    static func getFundsInfo(completionHandler: @escaping ((_ screen: Screen?, _ success: Bool) -> ())) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        FundsAPI.configAlamofire()
        
        FundsAPI.alamofireManager?.request(uri, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject(completionHandler: { (response: DataResponse<Funds>) in
            guard let fundsResponse = response.response else { return }
            switch fundsResponse.statusCode {
            case 200:
                if let fundsObject = response.result.value {
                    completionHandler(fundsObject.screen, true)
                }
            default:
                completionHandler(nil, false)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }
}
