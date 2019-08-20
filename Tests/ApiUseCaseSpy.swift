//
//  ApiUseCaseSpy.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 17/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain
import RxSwift


extension Domain.FormCell {
    static func newList(count: Int) -> [Domain.FormCell] {
        var list = [Domain.FormCell]()
        guard count > 0 else { return list }
        var i = 0
        while i < (count-1) {
            i += 1
            let cellType = (i % 4) + 1
            let object = try! Domain.FormCell(id: i, cellType: cellType, fieldType: "\((i % 3) + 1)", message: "message message message message message", topSpacing: 10, show: nil, hidden: ((i > 15) && cellType == 2), required: true)
            list.append(object)
        }
        let object = try! Domain.FormCell(id: i, cellType: 5, fieldType: "", message: "send", topSpacing: 10, show: nil, hidden: false, required: true)
        list.append(object)
        return list
    }
}

enum TestError: Error {
    case forceError
}

class ApiUseCaseSpy: Domain.ApiUseCase {
    
    var formCellList = Domain.FormCell.newList(count: 15)
    var fund = Domain.Fund(
        id: "1",
        title: "title title title title",
        fundName: "fundName fundName fundName fundName",
        whatIs: "whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs",
        definition: "definition definition definition definition definition definition definition definition definition definition definition definition definition",
        riskTitle: "What the risks are?",
        risk: 1,
        infoTitle: "More info: More Info:",
        monthFund: 1.0, monthCdi: 1.0,
        yearFund: 2.0, yearCdi: 2.0,
        twelveMonthsFund: 3.0, twelveMonthsCdi: 3.0,
        info: [FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data")],
        downInfo: [FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data"), FundInfo(name: "name", data: "data")])

    var getFundInfoCalled = false
    var getFormFieldsCalled = false
    var forceError = false
    
    
    func getFormFields() -> Observable<[FormCell]> {
        getFormFieldsCalled = true
        guard forceError == false else {
            return Observable.error(TestError.forceError)
        }
        return Observable.just(formCellList)
    }
    
    func getFundInfo() -> Observable<Fund> {
        getFundInfoCalled = true
        guard forceError == false else {
            return Observable.error(TestError.forceError)
        }
        return Observable.just(fund)
    }
    
}
