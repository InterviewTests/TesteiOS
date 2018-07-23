//
//  ImageCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var cellImageView: UIImageView!
    
    var cellMetaData:CellMetaData!
    static let identifier:String = "ImageCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "ImageCell", bundle: nil)
        return nibInfo
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(cellMetaData:CellMetaData){
        self.cellMetaData = cellMetaData
        
        if let cell = cellMetaData.cell{
            if let topSpacing = cell.topSpacing{
                topConstraint.constant = CGFloat(topSpacing)
            }
            if cellImageView.image == nil{
                if let message = cell.message{
                    if message.isEmpty == false{
                        if let url = URL.init(string: message){
                            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                                
                                if error != nil {
                                    return
                                }
                                if let data = data{
                                    DispatchQueue.main.async(execute: { () -> Void in
                                        if let image = UIImage.init(data: data){
                                            self.cellImageView.image = image
                                        }
                                    })
                                }
                                
                            }).resume()
                        }
                    }
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
