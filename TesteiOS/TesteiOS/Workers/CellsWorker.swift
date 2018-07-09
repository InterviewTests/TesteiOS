//
//  CellsWorker.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

class CellsWorker
{
    var cellsStore: CellsStoreProtocol
    
    init(cellsStore: CellsStoreProtocol)
    {
        self.cellsStore = cellsStore
    }
    
    func fetchCells(completionHandler: @escaping ([Cell]) -> Void)
    {
        cellsStore.fetchCells { (cells: () throws -> [Cell]) -> Void in
            do {
                let cells = try cells()
                DispatchQueue.main.async {
                    completionHandler(cells)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
    
    func createCell(cellToCreate: Cell, completionHandler: @escaping (Cell?) -> Void)
    {
        cellsStore.createCell(cellToCreate: cellToCreate) { (cell: () throws -> Cell?) -> Void in
            do {
                let cell = try cell()
                DispatchQueue.main.async {
                    completionHandler(cell)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping (Cell?) -> Void)
    {
        cellsStore.updateCell(cellToUpdate: cellToUpdate) { (cell: () throws -> Cell?) in
            do {
                let cell = try cell()
                DispatchQueue.main.async {
                    completionHandler(cell)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}

// MARK: - Cells store API

protocol CellsStoreProtocol
{
    // MARK: CRUD operations - Optional error
    
    func fetchCells(completionHandler: @escaping ([Cell], CellsStoreError?) -> Void)
    func fetchCell(id: Int, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    func createCell(cellToCreate: Cell, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    func deleteCell(id: String, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    
    // MARK: CRUD operations - Generic enum result type
    
    func fetchCells(completionHandler: @escaping CellsStoreFetchCellsCompletionHandler)
    func fetchCell(id: Int, completionHandler: @escaping CellsStoreFetchCellCompletionHandler)
    func createCell(cellToCreate: Cell, completionHandler: @escaping CellsStoreCreateCellCompletionHandler)
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping CellsStoreUpdateCellCompletionHandler)
    func deleteCell(id: String, completionHandler: @escaping CellsStoreDeleteCellCompletionHandler)
    
    // MARK: CRUD operations - Inner closure
    
    func fetchCells(completionHandler: @escaping (() throws -> [Cell]) -> Void)
    func fetchCell(id: Int, completionHandler: @escaping (() throws -> Cell?) -> Void)
    func createCell(cellToCreate: Cell, completionHandler: @escaping (() throws -> Cell?) -> Void)
    func updateCell(cellToUpdate: Cell, completionHandler: @escaping (() throws -> Cell?) -> Void)
    func deleteCell(id: String, completionHandler: @escaping (() throws -> Cell?) -> Void)
}

protocol CellsStoreUtilityProtocol {}

extension CellsStoreUtilityProtocol
{
    func generateCellID(cell: inout Cell)
    {
//        guard cell.id == nil else { return }
//        cell.id = "\(arc4random())"
    }
    
    func calculateCellTotal(cell: inout Cell)
    {
//        guard cell.total == NSDecimalNumber.notANumber else { return }
//        cell.total = NSDecimalNumber.one
    }
}

// MARK: - Cells store CRUD operation results

typealias CellsStoreFetchCellsCompletionHandler = (CellsStoreResult<[Cell]>) -> Void
typealias CellsStoreFetchCellCompletionHandler = (CellsStoreResult<Cell>) -> Void
typealias CellsStoreCreateCellCompletionHandler = (CellsStoreResult<Cell>) -> Void
typealias CellsStoreUpdateCellCompletionHandler = (CellsStoreResult<Cell>) -> Void
typealias CellsStoreDeleteCellCompletionHandler = (CellsStoreResult<Cell>) -> Void

enum CellsStoreResult<U>
{
    case Success(result: U)
    case Failure(error: CellsStoreError)
}

// MARK: - Cells store CRUD operation errors

enum CellsStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

func ==(lhs: CellsStoreError, rhs: CellsStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    default: return false
    }
}
