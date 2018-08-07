//
//  FundosDetailsDefaultCell.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

typealias FundosDetailsDefaultCell = UITableViewCell & FundosDetailsDefaultCellProtocol

protocol FundosDetailsDefaultCellProtocol: NSObjectProtocol {
    var delegate: FundosDetailsDefaultCellDelegate? { get set }
    func setInfo(info: FundosDetails.GetFund.ViewModel.DisplayedFundInfo)
}

protocol FundosDetailsDefaultCellDelegate {
    func downloadButtonTouched()
}
