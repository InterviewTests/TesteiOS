//
//  RoutesProtocol.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Alamofire

protocol URLRouter {
    static var basePath:String { get }
}

protocol Routable {
    typealias Parameters = [String : Any]
    var route:String {get set}
    init()
}

protocol Readable: Routable {}

protocol Creatable: Routable {}

protocol Updatable: Routable {}

protocol Deletable: Routable {}

protocol RequestConverterProtocol: URLRequestConvertible {
    var method:HTTPMethod {get set}
    var route:String {get set}
    var parameters:Parameters {get set}
    var jsonParameters:String {get set}
    var header:String? {get set}
}

struct RequestConverter: RequestConverterProtocol {
    
    var method:HTTPMethod
    var route:String
    var parameters:Parameters = [:]
    var jsonParameters:String
    var header:String?
    
    init(method:HTTPMethod, route:String, parameters:Parameters = [:], jsonParameters:String = "", header:String? = nil) {
        self.method = method
        self.route = route
        self.parameters = parameters
        self.jsonParameters = jsonParameters
    }
    
    func asURLRequest() -> URLRequest {
        let url = URL(string: Router.basePath)
        
        var urlRequest = URLRequest(url: (url?.appendingPathComponent(route))!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(header, forHTTPHeaderField: "Authorization")
        if(!jsonParameters.isEmpty && jsonParameters != "") {
            urlRequest.httpBody = jsonParameters.data(using: .utf8)
            return urlRequest
        }
        
        do {
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        }catch{
            return urlRequest
        }
    }
}

extension Routable {
    /// Create instance of Object that conforms to Routable
    init() {
        self.init()
    }
}

extension Readable {
    static func get(params:String, header:String? = nil) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .get, route: route, header: header)
    }
}

extension Creatable{
    static func create(parameters:Parameters = [:], jsonParameters:String = "", header:String? = nil) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)"
        return RequestConverter(method: .post, route: route, parameters: parameters, jsonParameters: jsonParameters, header: header)
    }
}

extension Updatable {
    static func update(params:String, parameters: Parameters = [:], jsonParameters:String = "", header:String? = nil) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .put, route: route, parameters: parameters, jsonParameters: jsonParameters, header: header)
    }
}

extension Deletable {
    static func delete(params: String, header:String? = nil) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .delete, route: route, header: header)
    }
}
