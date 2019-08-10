//
//  ApiUseCase.swift
//  ToDoList1.1
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import Realm
import RealmSwift

let url = "https://floating-mountain-50292.herokuapp.com/"//cells.json"


final class ApiUseCaseImplementation: ApiUseCase {
    
    //    private let repository: Repository
    //    init(repository: Repository) {
    //        self.repository = repository
    //    }
    
    func getFormFields() -> Observable<[FormCell]> {
        return Observable.just([FormCell(id: 1, cellType: "celltype", fieldType: "fieldType", message: "message 1", topSpacing: 10, show: 1, hidden: false, required: true), FormCell(id: 2, cellType: "celltype", fieldType: "fieldType", message: "message 2", topSpacing: 10, show: 1, hidden: false, required: false)])
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
    }
    
    func getFundInfo() -> Observable<Fund> {
        return Observable.just(Fund(id: "1", title: "Titulo", fundName: "Nome do Fundo", whatIs: "whatiswhatis whatiswhatis whatiswhatis whatiswhatis", definition: "def def def def def def def", riskTitle: "Qual o risco deste fundo?", risk: 3, infoTitle: "info title", monthFund: 0.56, monthCdi: 0.45, yearFund: 6.50, yearCdi: 4.90, twelveMonthsFund: 8.76, twelveMonthsCdi: 6.51, info: [FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data")], downInfo: [FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data")]))
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
    }
    
}
