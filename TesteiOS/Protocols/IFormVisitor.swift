//
//  IFormVisitor.swift
//  InvestApp
//
//  Created by Victor tavares on 07/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation

protocol IFormVisitor {

    associatedtype T

    func visit(node: FormData) -> T

    func visit(node: FormCell) -> T

}

extension FormData {
    func accept<T, E: IFormVisitor>(visitor: E) -> T where E.T == T {
        return visitor.visit(node: self)
    }
}

extension FormCell {
    func accept<T, E: IFormVisitor>(visitor: E) -> T where E.T == T {
        return visitor.visit(node: self)
    }
}
