//
//  Date+ext.swift
//  Platform
//
//  Created by Erika Segatto on 20/03/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation

extension Date {
    
    func asStringDate() -> String {
        return self.asDateTime(format: "dd/MM/yyyy")
    }
    
    func asStringTime() -> String {
        return self.asDateTime(format: "hh:mm a")
    }
    
    private func asDateTime(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
