//
//  Seeds.swift
//  SantanderTests
//
//  Created by Gabriel vieira on 4/23/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

@testable import Santander
@testable import ObjectMapper
@testable import Alamofire

import XCTest

//struct Seeds
//{
//    struct Gists
//    {
//        static let text = Gist(login: "amy", url: "https://gist.github.com/rayvinly/27e1cc51efc3a1015a1e", filename: "amy.txt", filetype: "text/plain")
//        static let html = Gist(login: "bob", url: "https://gist.github.com/rayvinly/46396696f020c3e0931c", filename: "bob.html", filetype: "text/html")
//    }
//
//    struct DisplayedGists
//    {
//        static let text = ListGists.FetchGists.ViewModel.DisplayedGists(login: Gists.text.login, url: Gists.text.url, filename: Gists.text.filename, filetype: Gists.text.filetype)
//        static let html = ListGists.FetchGists.ViewModel.DisplayedGists(login: Gists.html.login, url: Gists.html.url, filename: Gists.html.filename, filetype: Gists.html.filetype)
//    }
//
//    struct JSON {
//        static let data: Data =
//        {
//            let bundle = Bundle(identifier: "com.clean-swift.GisterTests")!
//            let path = bundle.path(forResource: "Gist", ofType: "json")!
//            let data = FileManager.default.contents(atPath: path)!
//            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            return data
//        }()
//    }
//}

class Seed {
    class func loadJSONFile(fileName: String) -> [String: Any]? {
        
        let bundle = Bundle(identifier: "com.gabrielvft.SantanderTests")!
        
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                    return jsonResult
                }
            } catch {
                return nil
            }
        }
        return nil
    }
    
    class func CellData() -> FormCells {
        
        let json = self.loadJSONFile(fileName: "cells")!
        
        guard let obj = Mapper<FormCells>().map(JSON: json) else {
            return FormCells()
        }
        
        return obj
    }
    
    class func prepareViewModel(_ cells: [Cells]) -> [Contact.fetchFormCells.ViewModel.DisplayCells] {
        
        let list = cells.map {
            Contact.fetchFormCells.ViewModel.DisplayCells(hidden: $0.hidden ?? true, id: $0.id ?? 0, topSpacing: $0.topSpacing ?? 0, typefield: $0.typefield ?? 0, required: $0.required ?? false, message: $0.message ?? "", type: $0.type ?? 0, show: $0.show ?? 0)
        }
        
        return list
    }
    
    class func fundsData() -> Fund {
        
        let json = self.loadJSONFile(fileName: "fund")!
        
        guard let obj = Mapper<Fund>().map(JSON: json) else {
            return Fund()
        }
        
        return obj
    }
    
    class func createProfiabilityList(fund: Fund) -> [Investment.FetchFund.ViewModel.ProfiabilityList]{
        
        let list = [
            Investment.FetchFund.ViewModel.ProfiabilityList(name: "No mês",
                                                            fund: self.formatToPercent(fund.screen?.moreInfo?.month?.fund),
                                                            cdi: self.formatToPercent(fund.screen?.moreInfo?.month?.cDI)),
            
            Investment.FetchFund.ViewModel.ProfiabilityList(name: "No Ano",
                                                            fund: self.formatToPercent(fund.screen?.moreInfo?.year?.fund),
                                                            cdi: self.formatToPercent(fund.screen?.moreInfo?.year?.cDI)),
            
            Investment.FetchFund.ViewModel.ProfiabilityList(name: "12 meses",
                                                            fund: self.formatToPercent(fund.screen?.moreInfo?.twelveMonths?.fund),
                                                            cdi: self.formatToPercent(fund.screen?.moreInfo?.twelveMonths?.cDI))
            
        ]
        return list
    }
    
    class func formatToPercent(_ num: Double?) -> String {
        
        var formated:String = String(format:"%.1f", num ?? 0.0)
        let replaceDot = formated.replacingOccurrences(of: ".", with: ",")
        return "\(replaceDot)%"
    }
}



