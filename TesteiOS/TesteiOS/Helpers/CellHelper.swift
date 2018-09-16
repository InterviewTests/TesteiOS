//
//  CellHelper.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

func getMessage(fromCellId id: Int, in arr: [Cell]) -> String {
    let cell = arr.filter { (cell) -> Bool in
        cell.id == id
    }
    return cell[0].message
}
