//
// CellType.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import Foundation

enum CellType: Int, Decodable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}
