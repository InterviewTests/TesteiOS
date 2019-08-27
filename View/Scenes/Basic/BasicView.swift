//
//  BaseView.swift
//  biblio-swift-1.1
//
//  Created by Erika Segatto on 22/02/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation

protocol BasicView: class {
    func showError(_ error: Error, title: String)
    func showError(_ error: Error)
}


