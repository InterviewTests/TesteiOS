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
    
    init(cellsStore: CellsStoreProtocol) {
        self.cellsStore = cellsStore
    }
    
    func fetchCells(completionHandler: @escaping ([Cell]) -> Void) {
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
}

// MARK: - Cells store API

protocol CellsStoreProtocol {
    // MARK: Fetch operations - Optional error
    
    func fetchCells(completionHandler: @escaping ([Cell], CellsStoreError?) -> Void)
    func fetchCell(id: Int, completionHandler: @escaping (Cell?, CellsStoreError?) -> Void)
    
    // MARK: Fetch operations - Generic enum result type
    
    func fetchCells(completionHandler: @escaping CellsStoreFetchCellsCompletionHandler)
    func fetchCell(id: Int, completionHandler: @escaping CellsStoreFetchCellCompletionHandler)
    
    // MARK: Fetch operations - Inner closure
    
    func fetchCells(completionHandler: @escaping (() throws -> [Cell]) -> Void)
    func fetchCell(id: Int, completionHandler: @escaping (() throws -> Cell?) -> Void)
}

protocol CellsStoreUtilityProtocol {}

// MARK: - Cells store Fetch operation results

typealias CellsStoreFetchCellsCompletionHandler = (CellsStoreResult<[Cell]>) -> Void
typealias CellsStoreFetchCellCompletionHandler = (CellsStoreResult<Cell>) -> Void

enum CellsStoreResult<U> {
    case Success(result: U)
    case Failure(error: CellsStoreError)
}

// MARK: - Cells store Fetch operation errors

enum CellsStoreError: Equatable, Error {
    case CannotFetch(String)
}

func ==(lhs: CellsStoreError, rhs: CellsStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    default: return false
    }
}
