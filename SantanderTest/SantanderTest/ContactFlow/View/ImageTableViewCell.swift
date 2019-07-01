//
//  ImageTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell
{
    @IBOutlet weak var anyImageView: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
