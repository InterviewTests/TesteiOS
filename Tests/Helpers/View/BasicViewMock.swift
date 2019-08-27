//
//  BasicViewMock.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 20/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
@testable import TesteiOS


class BasicViewMock: BasicView {
    var errorShowed: Error? = nil
    
    func showError(_ error: Error, title: String) { errorShowed = error }
    func showError(_ error: Error) { errorShowed = error }
    
}
