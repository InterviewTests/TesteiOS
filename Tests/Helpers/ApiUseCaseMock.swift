//
//  ApiUseCaseMock.swift
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
        
        for i in 1...(count-1) {
            let cellType = (i % 4) + 1
            let object = try! Domain.FormCell(id: i, cellType: cellType, fieldType: "\((i % 3) + 1)", message: "message message message message message \(i)", topSpacing: Double(i), show: nil, hidden: (i % 5 == 1), required: (i % 2 == 1))
            list.append(object)
        }
        let object = try! Domain.FormCell(id: count, cellType: 5, fieldType: "", message: "send", topSpacing: 10, show: nil, hidden: false, required: true)
        list.append(object)
        return list
    }
}

class ApiUseCaseMock: Domain.ApiUseCase {
    
    var apiDelay: Bool = true
    var formCellList = Domain.FormCell.newList(count:5)
    var fund = Domain.Fund(
        id: "1",
        title: "title title title title",
        fundName: "fundName fundName fundName fundName",
        whatIs: "whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs whatIs",
        definition: "definition definition definition definition definition definition definition definition definition definition definition definition definition",
        riskTitle: "What the risks are?",
        risk: 1,
        infoTitle: "More info: More Info:",
        monthFund: 1.0, monthCdi: 2.0,
        yearFund: 3.0, yearCdi: 4.0,
        twelveMonthsFund: 5.0, twelveMonthsCdi: 6.0,
        info: [FundInfo(name: "name1", data: "data1"), FundInfo(name: "name2", data: "data2"), FundInfo(name: "name3", data: "data3")],
        downInfo: [FundInfo(name: "name4", data: "data4"), FundInfo(name: "name5", data: "data5"), FundInfo(name: "name6", data: "data6"), FundInfo(name: "name7", data: "data7")])

    var getFundInfoCalled = false
    var getFormFieldsCalled = false
    var sendFormCalled = false
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
    
    
    func sendForm(_ form: [FormCell]) -> Observable<Void> {
        sendFormCalled = true
        guard forceError == false else {
            return Observable.error(TestError.forceError)
        }
        if apiDelay {
            return Observable.just(Void())
                .delay(0.7, scheduler: ConcurrentMainScheduler.instance)
                .subscribeOn(ConcurrentMainScheduler.instance)
                .observeOn(MainScheduler.instance)
        }
        return Observable.just(Void())
    }
}
