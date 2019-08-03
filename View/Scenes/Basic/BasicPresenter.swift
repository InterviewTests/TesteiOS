//
//  BasePresenter.swift
//  biblio-swift-1.1
//
//  Created by Erika Segatto on 21/02/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation

protocol BasicPresenter : class {
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    
    func handleError(_ view: BasicView?, error: Error)
}

extension BasicPresenter {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDisappear() {}
}
