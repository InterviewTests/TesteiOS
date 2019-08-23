//
//  Service.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

protocol Service {
    typealias ResultCompletion<T> = (_ result: Result<T, Error>) -> ()
}
