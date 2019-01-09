//
//  RequestBase.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation
import Alamofire

// Class responsible for all the requests performed inside the app
class RequestBase {
    
    /// Holds any parameters that the requests may need
    var parameters:[String:Any] = [:]
    
    /// Controls the session configuration
    private static let session: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        return SessionManager(configuration: configuration)
    }()
    
    /// The name of the Endpoint
    private var endpointName = ""
    
    /// Returns the Base URL, according to the development environment (Debug or Release)
    private var BASE_URL:String {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
    
    /// The request URL
    private var defaultURL:String{
        get{
            if let path = Bundle.main.path(forResource: "Endpoint", ofType: "plist") {
                if let plist = NSDictionary(contentsOfFile: path), let endpoint = plist[endpointName] as? String {
                    return BASE_URL + endpoint
                }
                else{
                    fatalError("The endpoint named ''\(endpointName)'' does not exist")
                }
            }
            else{
                fatalError("The file ''endpoints'' could not be located")
            }
        }
    }
    
    init() {

    }
    
    func get(endpoint:Endpoint, parameters: Parameters?=nil) -> DataRequest {
        endpointName = endpoint.rawValue
        printAccess(parameters)
        return RequestBase.session.request(defaultURL, method: .get, parameters: parameters, headers:nil)
    }
    
    // Request logs
    private func printAccess(_ parameters: Parameters?){
        let param: Any = parameters ?? "--"
        print("\n ======== URL SENDO ACESSADA ======== \n\n - URL:\n \(defaultURL) \n\n - PARAMETROS:\n \(param)\n ==================================== \n")
    }
}

enum Endpoint:String {
    
    /// Endpoint for the form items
    case form
    
    /// Endpoint for the details of the product
    case product
}
