//
//  Resource.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/14/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct Resource {
    
    var node: String
    
    subscript(leaf: Resource) -> Resource {
        return Resource(node: "\(node)/\(leaf.node)")
    }
    
    subscript(reference: String) -> Resource {
        return Resource(node: "\(node)/\(reference)")
    }
    
}

extension Resource {
    
    static let fund = Resource(node: "fund.json")
    static let cells = Resource(node: "cells.json")
    
}
