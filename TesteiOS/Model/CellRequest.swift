//
//  CellRequest.swift
//  TesteiOS
//
//  Created by Naville Brasil on 18/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation

protocol CellRequestDelegate
{
    func getValuesOfCell(withArrayValues array: [Cell])
}

class CellRequest
{
    static let shared = CellRequest()
    var delegate: CellRequestDelegate?
    var arrayCell: [Cell] = []
}

extension CellRequest: WebServicesDelegate
{
    func getJson(json: [String : AnyObject])
    {
        print(json)
        
        if let cells = json["cells"] as? NSArray
        {
            print("cells")
            for eachCell in cells
            {
                if let cell = eachCell as? NSDictionary
                {
                    print("cell")
                    guard let id = cell["id"] as? Int,let type = cell["type"] as? Int, let message = cell["message"] as? String, let hidden = cell["hidden"] as? Bool, let topSpacing = cell["topSpacing"] as? Double, let required = cell["required"] as? Bool else {return}
                    
                    let typefield = cell["typefield"] as? Int ?? 2
                    
                    let show = cell["show"] as? Int ?? 0
                   
                    print("id ===>", id)
                    print("type ===>", type)
                    print("message ===>", message)
                    print("typefield ===>", typefield)
                    print("hidden ===>", hidden)
                    print("topSpacing ===>", topSpacing)
                    print("show ===>", show)
                    print("required ===>", required)
                    
                    self.arrayCell.append(Cell(id: id, type: type, message: message, typefield: typefield, hidden: hidden, topSpacing: topSpacing, show: show, required: required))
                }
            }
            
            self.delegate?.getValuesOfCell(withArrayValues: self.arrayCell)
        }
    }
    
    func request()
    {
        let ws = WebService(
            function: "cells.json",
            fields: "",
            authUser: "",
            authPassword: "",
            type: "GET",
            token: "")
        
        ws.setUrlServer(urlServer: ServerData.shared.url)
        ws.conect()
        ws.delegate = self
    }
}
