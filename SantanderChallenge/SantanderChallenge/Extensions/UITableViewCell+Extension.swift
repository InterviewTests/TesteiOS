//
// UITableViewCell+Extension.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

extension UITableViewCell {
    static var reusableIdentifier: String {
        return String(describing: self.classForCoder())
    }
}
