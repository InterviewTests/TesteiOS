//
//  SantanderPresenter.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 25/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
protocol SantanderPresenterInterface: class{
    func fetchedCells(completion: @escaping (_ cellsSantander: Cells?, _ error: Error?) -> Void)
}

class SantanderPresenter: SantanderPresenterInterface {
    static let sharedManager: SantanderPresenterInterface = {
        let santanderPresenter = SantanderPresenter()
        return santanderPresenter
    }()
    private var santanderInteractor = SantanderInteractor()

    func fetchedCells(completion: @escaping (_ cellsSantander: Cells?, _ error: Error?) -> Void){
        self.santanderInteractor.fetchCellEntity { (cells, error) in
            completion(cells, error)
        }
    }
}
