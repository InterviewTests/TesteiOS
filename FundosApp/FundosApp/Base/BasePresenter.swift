//
//  BasePresenter.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
protocol BasePresenter{
    associatedtype V
    var view: V { get set }
    
    associatedtype S
    var service: S { get set }
}

