//
//  FundosContatoInteractor.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundosContatoBusinessLogic {
}

protocol FundosContatoDataStore {
}


class FundosContatoInteractor: FundosContatoBusinessLogic, FundosContatoDataStore {
    var presenter: FundosContatoPresentationLogic?
}
