//
//  ViewCoding.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

import SnapKit

public protocol ViewCoding {
    
    func buildViewCode()
    func insertViews()
    func setupConstraints()
    func setupViews()
    
}

public extension ViewCoding {
    
    func buildViewCode() {
        insertViews()
        setupConstraints()
        setupViews()
    }
    
    func setupViews() {}
    
}
