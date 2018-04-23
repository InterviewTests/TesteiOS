//
//  MoreInfoTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 22/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: CusomTableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cid: UILabel!
    @IBOutlet weak var fund: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
