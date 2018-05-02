//
//  SectionTwoTableViewCell.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class SectionTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldOne: UILabel!
    @IBOutlet weak var fieldTwo: UILabel!
    @IBOutlet weak var vDownload: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fieldTwo.isHidden = false
        vDownload.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showDownloadView() {
        fieldTwo.isHidden = true
        vDownload.isHidden = false
    }

    @IBAction func downloadPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://www.google.com")!, options: [:], completionHandler: nil)
    }
}
