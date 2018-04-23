//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Matheus Weber on 30/03/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

