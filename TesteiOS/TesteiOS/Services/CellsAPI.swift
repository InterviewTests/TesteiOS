//
//  CellsAPI.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

class CellsAPI: CellsStoreProtocol, CellsStoreUtilityProtocol {
    
    // MARK: - Data
    
    var cellList: CellList? = CellList()
    var cells:[Cell] {
        if let list: CellList = self.cellList {
            return list.cells
        }
        return []
    }
    
    // MARK: - Object lifecycle
    
    init() {
        self.fetch()
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)?.replacingOccurrences(of: "\"telnumber\"", with: "2") // NO JSON DEVERIA VIR O INTEIRO 2 NA PROPRIEDADE typefield DO CAMPO DE id = 6 MAS ALGUM MOMENTO DURANTE OS TESTES EM 08/07/2018 VEIO A STRING "telnumber"
            print(jsonString ?? "Erro")
            
            do {
//                defer {
//                    DispatchQueue.main.sync{
//                        self.tableView.reloadData()
//                    }
//                }
                
                let decoder = JSONDecoder()
                self.cellList = try decoder.decode(CellList.self, from: jsonString!.data(using: .utf8)!)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: - CRUD operations - Optional error
    
    func fetchCells(completionHandler: @escaping ([Cell], CellsStoreError?) -> Void) {
        completionHandler(self.cells, nil)
    }
    
    func fetchCell(id: Int, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void){
        if let index = indexOfCellWithID(id: id) {
            let cell = self.cells[index]
            completionHandler(cell, nil)
        } else {
            completionHandler(nil, CellsStoreError.CannotFetch("Cannot fetch cell with id \(id)"))
        }
    }
    
    func createCell(cellToCreate: Cell, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    {
    }
    
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    {
    }
    
    func deleteCell(id: String, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    {
    }
    
    // MARK: - CRUD operations - Generic enum result type
    
    func fetchCells(completionHandler: @escaping CellsStoreFetchCellsCompletionHandler) {
        completionHandler(CellsStoreResult.Success(result: self.cells))
    }
    
    func fetchCell(id: Int, completionHandler: @escaping CellsStoreFetchCellCompletionHandler) {
        let cell = self.cells.filter { (cell: Cell) -> Bool in
            return cell.id == id
            }.first
        if let cell = cell {
            completionHandler(CellsStoreResult.Success(result: cell))
        } else {
            completionHandler(CellsStoreResult.Failure(error: CellsStoreError.CannotFetch("Cannot fetch cell with id \(id)")))
        }
    }
    
    func createCell(cellToCreate: Cell, completionHandler: @escaping CellsStoreCreateCellCompletionHandler)
    {
    }
    
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping CellsStoreUpdateCellCompletionHandler)
    {
    }
    
    func deleteCell(id: String, completionHandler: @escaping CellsStoreDeleteCellCompletionHandler)
    {
    }
    
    // MARK: - CRUD operations - Inner closure
    
    func fetchCells(completionHandler: @escaping (() throws -> [Cell]) -> Void) {
        completionHandler { return self.cells }
    }
    
    func fetchCell(id: Int, completionHandler: @escaping (() throws -> Cell?) -> Void) {
        if let index = indexOfCellWithID(id: id) {
            completionHandler { return self.cells[index] }
        } else {
            completionHandler { throw CellsStoreError.CannotFetch("Cannot fetch cell with id \(id)") }
        }
    }
    
    func createCell(cellToCreate: Cell, completionHandler: @escaping (() throws -> Cell?) -> Void)
    {
    }
    
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping (() throws -> Cell?) -> Void)
    {
    }
    
    func deleteCell(id: String, completionHandler: @escaping (() throws -> Cell?) -> Void)
    {
    }
    
    // MARK: - Convenience methods
    
    private func indexOfCellWithID(id: Int?) -> Int? {
        return self.cells.index { return $0.id == id }
    }
}
