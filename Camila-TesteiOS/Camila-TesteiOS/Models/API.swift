//
//  API.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class API {
    func fetchCells(completionHandler: @escaping ([Cell]) -> Void){
        //TODO temporariamente até consumir de verdade a api
        let cell = Cell.init(viewModel: FormModels.FetchCell.ViewModel.DisplayedCell(id: 1, type: 1, message: "teste", typefield: 1, hidden: false, topSpacing: 20, show: 2, required: false))
        let cells = [cell]
        
        DispatchQueue.main.async {
            completionHandler(cells)
        }
    }
}
