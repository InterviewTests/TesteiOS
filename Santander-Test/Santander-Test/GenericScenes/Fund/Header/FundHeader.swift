//
//  FundHeader.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 16/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class FundHeader: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var fundName: UILabel!
    @IBOutlet weak var whatIs: UILabel!
    @IBOutlet weak var definition: UILabel!
    
    static let reuseIdentifier = "FundHeader"
    
    var viewModel: FundHeader.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        
        title.text = viewModel.title
        fundName.text = viewModel.fundName
        whatIs.text = viewModel.whatIs
        definition.text = viewModel.definition
    }
    
}

extension FundHeader {
    struct ViewModel {
        var title: String
        var fundName: String
        var whatIs: String
        var definition: String
    }
}
