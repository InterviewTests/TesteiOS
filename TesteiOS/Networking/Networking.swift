//
//  Networking.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

protocol Networking {
    func request(request:URLRequest,_ dataResponse: @escaping (Any?) -> ())
}
