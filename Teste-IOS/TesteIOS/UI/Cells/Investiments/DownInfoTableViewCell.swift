//
//  DownInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit
import SafariServices

protocol DownloadDelegate {
    func download()
}

class DownInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDownInfo: UILabel!
    var delegate: DownloadDelegate!
    
    func configureCell(info: DataInfo) {
        self.lblDownInfo.text = info.name
    }
    
    @IBAction func tapDownload(_ sender: Any) {
        delegate.download()
    }
}
