//
//  Investment.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation
import UIKit

public struct InfoData
{
    var name: String
    var data: String
}

public struct MoreInfo
{
    public var fund: Double
    public var cdi: Double
    
    public init()
    {
        self.fund = 0.0
        self.cdi = 0.0
    }
    
    public init(fund: Double, cdi: Double)
    {
        self.fund = fund
        self.cdi = cdi
    }
}

class Investment
{
    internal var title: String?
    internal var fundName: String?
    internal var whatIs: String?
    internal var definition: String?
    internal var riskTitle: String?
    internal var risk: Int?
    internal var infoTitle: String?
    internal var monthFund: Double?
    internal var monthCdi: Double?
    internal var yearFund: Double?
    internal var yearCdi: Double?
    internal var monthsFund: Double?
    internal var monthsCdi: Double?
    internal var arrayInformations: [InfoData] = []
    internal var arrayDownInfos: [InfoData] = []
    
    var month: MoreInfo
    {
        if self.monthFund != nil && self.monthCdi != nil
        {
            return MoreInfo(fund: self.monthFund!, cdi: self.monthCdi!)
        }
        return MoreInfo(fund: 0.0, cdi: 0.0)
    }
    
    var year: MoreInfo
    {
        if self.yearFund != nil && self.yearCdi != nil
        {
            return MoreInfo(fund: self.yearFund!, cdi: self.yearCdi!)
        }
        return MoreInfo(fund: 0.0, cdi: 0.0)
    }
    
    var months: MoreInfo
    {
        if self.monthsFund != nil && self.monthsCdi != nil
        {
            return MoreInfo(fund: self.monthsFund!, cdi: self.monthsCdi!)
        }
        return MoreInfo(fund: 0.0, cdi: 0.0)
    }
    
}
