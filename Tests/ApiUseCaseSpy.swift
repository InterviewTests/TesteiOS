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
        var i = 0
        while i < count {
            i += 1
            let object = try! Domain.FormCell(id: i, cellType: (i % 5) + 1, fieldType: (i % 3) + 1, message: "message message message message message", topSpacing: 10, show: i % 2, hidden: (i > 15), required: (i % 2 == 1)
            )
            list.append(object)
        }
        return list
    }
}

//struct NotificationPublisher {
//    static let instance = ReplaySubject<[Domain.Notification]>.create(bufferSize: 1)
//    static func publish(_ object: [Domain.Notification]) { NotificationPublisher.instance.onNext(object) }
//}

enum TestError: Error {
    case forceError
}

class ApiUseCaseSpy: Domain.ApiUseCase {
    
    
    var formCellList = Domain.FormCell.newList(count: 20)
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
//    var refreshAllCalled = false
//    var getAllCalled = false
//    var markAsReadCalled = false
//    var deleteCalled = false

    var forceError = false
    
    
    func getFormFields() -> Observable<[FormCell]> {
        guard forceError == false else {
            return Observable.error(TestError.forceError)
        }
        return Observable.just(formCellList)
    }
    
    func getFundInfo() -> Observable<Fund> {
        guard forceError == false else {
            return Observable.error(TestError.forceError)
        }
        return Observable.just(fund)
    }
    
}
