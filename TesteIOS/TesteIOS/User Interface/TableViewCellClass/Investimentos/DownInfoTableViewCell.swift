//
//  DownInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
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
