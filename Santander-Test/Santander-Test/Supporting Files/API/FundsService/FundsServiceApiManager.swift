//
//  FundsServiceApiManager.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Moya

class FundsServiceApiManager {
    
    static let shared = FundsServiceApiManager()
    
    private init() {}
    
    private let provider = MoyaProvider<FundsServiceApi>()
    
    func getFormCells(completion: @escaping ([FormCell]?, Error?) -> Void) {
        provider.request(.getFormCellsList) { [unowned self] (response) in
            switch response {
            case .success(let value):
                do {
                    let formCellsList: FormCellsList = try JSONDecoder().decode(FormCellsList.self, from: value.data)
                    let formCells = self.getFormCells(from: formCellsList)
                    
                    completion(formCells, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getFundsList(completion: @escaping (FundsList?, Error?) -> Void) {
        provider.request(.getFundsList) { (response) in
            switch response {
            case .success(let value):
                do {
                    let fundsList: FundsList = try JSONDecoder().decode(FundsList.self, from: value.data)
                    completion(fundsList, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    private func getFormCells(from formCellsList: FormCellsList) -> [FormCell] {
        
        var formCells: [FormCell] = []
        for formCellModel in formCellsList.cells {
            let id = formCellModel.id
            let type: Type? = {
                switch formCellModel.type {
                case 1:
                    return Type.field
                case 2:
                    return Type.text
                case 3:
                    return Type.image
                case 4:
                    return Type.checkbox
                case 5:
                    return Type.send
                default:
                    return nil
                }
            }()
            let message = formCellModel.message
            let typefield: TypeField? = {
                if let typeFieldString = formCellModel.typefield?.value as? String {
                    switch typeFieldString {
                    case "email":
                        return TypeField.email
                    case "telNumber":
                        return TypeField.telNumber
                    case "text":
                        return TypeField.text
                    default:
                        return nil
                    }
                } else if let typeFieldInt = formCellModel.typefield?.value as? Int {
                    switch typeFieldInt {
                    case 1:
                        return TypeField.text
                    case 2:
                        return TypeField.telNumber
                    case 3:
                        return TypeField.email
                    default:
                        return nil
                    }
                } else {
                    return nil
                }
            }()
            let hidden = formCellModel.hidden
            let topSpacing = formCellModel.topSpacing
            let show = formCellModel.show
            let required = formCellModel.required
            
            let formCell = FormCell(
                id: id,
                type: type,
                message: message,
                typefield: typefield,
                hidden: hidden,
                topSpacing: topSpacing,
                show: show,
                required: required
            )
            formCells.append(formCell)
        }
        
        return formCells
    }
    
}
