//
//  downloadTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class downloadTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    var url: URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(downInfo: Info) {
        title.text = downInfo.title
        url = URL(string: downInfo.value)
    }
    
    @IBAction func download(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com/") else { return }
        UIApplication.shared.open(url)
    }

}
