//
//  InvestmentInformationTableViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 12/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class InvestmentInformationTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var viewModel: Investment.InvestmentInformationTableCell.ViewModel = Investment.InvestmentInformationTableCell.ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  private func didSetViewModel() {
    titleLabel.text = viewModel.title
    descriptionLabel.text = viewModel.description
    
    switch viewModel.type {
    case .noData:
      descriptionLabel.textColor = UIColor.init(hex: "DA0101")
      configureDownloadButton()
      setupClickListener()
      
    default:
      descriptionLabel.textColor = .black
    }
  }
  
  private func setupClickListener() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(InvestmentInformationTableViewCell.clickOnDownload(sender:)))
    
    descriptionLabel.addGestureRecognizer(tap)
    descriptionLabel.isUserInteractionEnabled = true
  }
  
  @objc private func clickOnDownload(sender: UITapGestureRecognizer) {
    guard let url = URL(string: "www.google.com.br") else {
      return
    }
    
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
      UIApplication.shared.openURL(url)
    }
  }
  
  private func configureDownloadButton() {
    let fullString = NSMutableAttributedString(string: "")
    let image1Attachment = NSTextAttachment()
    image1Attachment.image = UIImage(named: "download-icon")
    
    let image1String = NSAttributedString(attachment: image1Attachment)
    
    fullString.append(image1String)
    fullString.append(NSAttributedString(string: " Baixar"))
    
    // draw the result in a label
    descriptionLabel.attributedText = fullString
  }
}
