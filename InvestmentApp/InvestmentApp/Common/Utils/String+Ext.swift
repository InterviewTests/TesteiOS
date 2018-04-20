//
//  String+Ext.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

extension String {
    var html2AttributedString: NSMutableAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            return try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func getLastAddress() -> String {
        let exploded = self.components(separatedBy: "/")
        if let last = exploded.last {
            return last
        }
        return ""
    }
}
