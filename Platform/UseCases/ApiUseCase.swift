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
import RxAlamofire

struct APIConstants {
    static let baseURL = "https://floating-mountain-50292.herokuapp.com/"
    
    static let getCells = "cells.json"
    static let getFund = "fund.json"
}

final class ApiUseCaseImplementation: ApiUseCase {
    static let instance = ApiUseCaseImplementation()
    private init() {
    }
    
    public static func getUseCase() -> ApiUseCase {
        return instance
    }
    
    
    // MARK: API Function
    public func getFormFields() -> Observable<[FormCell]> {
        let urlString = APIConstants.baseURL + APIConstants.getCells
        
        return RxAlamofire.json(.get, urlString)
            .map({ (response) -> [FormCell] in
                print("URL success: \(urlString)")
                var result = [FormCell]()
                guard let json = response as? [String: Any] else { throw UseCaseError.invalidField("", response) }
                guard let cells = json["cells"] as? [[String: Any]] else { throw UseCaseError.invalidField("cells", json) }
            
                for cell in cells {
                    guard let id = cell["id"] as? Int else { throw UseCaseError.invalidAttribute("id", cell["id"]) }
                    guard let type = cell["type"] as? Int else { throw UseCaseError.invalidAttribute("type", cell["type"]) }
                    guard let message = cell["message"] as? String else { throw UseCaseError.invalidAttribute("message", cell["message"]) }
                    guard let topSpacing = cell["topSpacing"] as? Double else { throw UseCaseError.invalidAttribute("topSpacing", cell["topSpacing"]) }
                    guard let hidden = cell["hidden"] as? Bool else { throw UseCaseError.invalidAttribute("hidden", cell["hidden"]) }
                    guard let required = cell["required"] as? Bool else { throw UseCaseError.invalidAttribute("required", cell["required"]) }
                    var fieldType = ""
                    if let fieldTypeInt = cell["typefield"] as? Int {
                        fieldType = String(fieldTypeInt)
                    } else {
                        fieldType = cell["typefield"] as? String ?? ""
                    }
                    let show = cell["show"] as? Int
                    
                    let formcell = try FormCell(id: id, cellType: type, fieldType: fieldType, message: message, topSpacing: topSpacing, show: show, hidden: hidden, required: required)
                    result.append(formcell)
                }
                return result
            })
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
    }
    
    public func getFundInfo() -> Observable<Fund> {
        let urlString = APIConstants.baseURL + APIConstants.getFund
        
        return RxAlamofire.json(.get, urlString)
            .map({ (response) -> Fund in
                print("URL success: \(urlString)")
                guard let json = response as? [String: Any] else { throw UseCaseError.invalidField("", response) }
                guard let fund = json["screen"] as? [String: Any] else { throw UseCaseError.invalidField("screen", json) }
                
                // fund attributes
                guard let title = fund["title"] as? String else { throw UseCaseError.invalidAttribute("title", fund) }
                guard let fundName = fund["fundName"] as? String else { throw UseCaseError.invalidAttribute("fundName", fund) }
                guard let whatIs = fund["whatIs"] as? String else { throw UseCaseError.invalidAttribute("whatIs", fund) }
                guard let definition = fund["definition"] as? String else { throw UseCaseError.invalidAttribute("definition", fund) }
                guard let riskTitle = fund["riskTitle"] as? String else { throw UseCaseError.invalidAttribute("riskTitle", fund) }
                guard let risk = fund["risk"] as? Int else { throw UseCaseError.invalidAttribute("risk", fund) }
                guard let infoTitle = fund["infoTitle"] as? String else { throw UseCaseError.invalidAttribute("infoTitle", fund) }
                
                // moreInfo
                guard let moreInfo = fund["moreInfo"] as? [String: [String: Any?]] else { throw UseCaseError.invalidField("moreInfo", fund) }
                guard let monthFund = moreInfo["month"]?["fund"] as? Double else { throw UseCaseError.invalidAttribute("month.fund", moreInfo) }
                guard let monthCdi = moreInfo["month"]?["CDI"] as? Double else { throw UseCaseError.invalidAttribute("month.cdi", moreInfo) }
                guard let yearFund = moreInfo["year"]?["fund"] as? Double else { throw UseCaseError.invalidAttribute("year.fund", moreInfo) }
                guard let yearCdi = moreInfo["year"]?["CDI"] as? Double else { throw UseCaseError.invalidAttribute("year.cdi", moreInfo) }
                guard let twelveMonthsFund = moreInfo["12months"]?["fund"] as? Double else { throw UseCaseError.invalidAttribute("12months.fund", moreInfo) }
                guard let twelveMonthsCdi = moreInfo["12months"]?["CDI"] as? Double else { throw UseCaseError.invalidAttribute("12months.cdi", moreInfo) }
                
                // info
                var fundInfo = [FundInfo]()
                guard let infoList = fund["info"] as? [[String: Any?]] else { throw UseCaseError.invalidField("info", fund) }
                for info in infoList {
                    guard let name = info["name"] as? String else { throw UseCaseError.invalidAttribute("name", info) }
                    let data = (info["data"] as? String) ?? ""
                    fundInfo.append(FundInfo(name: name, data: data))
                }
                
                // downInfo
                var fundDownInfo = [FundInfo]()
                guard let downInfoList = fund["downInfo"] as? [[String: Any?]] else { throw UseCaseError.invalidField("downInfo", fund) }
                for downInfo in downInfoList {
                    guard let name = downInfo["name"] as? String else { throw UseCaseError.invalidAttribute("name", downInfo) }
                    let data = (downInfo["data"] as? String) ?? ""
                    fundDownInfo.append(FundInfo(name: name, data: data))
                }
                
                return Fund(id: "1", title: title, fundName: fundName, whatIs: whatIs, definition: definition, riskTitle: riskTitle, risk: risk, infoTitle: infoTitle, monthFund: monthFund, monthCdi: monthCdi, yearFund: yearFund, yearCdi: yearCdi, twelveMonthsFund: twelveMonthsFund, twelveMonthsCdi: twelveMonthsCdi, info: fundInfo, downInfo: fundDownInfo)
            })
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
    }
    
    
    func sendForm(_ form: [FormCell]) -> Observable<Void> {
        return Observable.just(Void())
            .subscribeOn(ConcurrentMainScheduler.instance)
            .observeOn(MainScheduler.instance)
    }
}
