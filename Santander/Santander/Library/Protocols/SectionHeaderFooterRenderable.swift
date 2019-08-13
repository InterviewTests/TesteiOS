//
//  SectionHeaderFooterRenderable.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Eureka

// MARK: Section Header Footer Renderable Protocol

/**
 *  Protocol used to set headers and footers to sections.
 *  Can be set with a view or a String
 */
public protocol SectionHeaderFooterRenderable {
    func viewForItem() -> HeaderFooterViewRepresentable
}
