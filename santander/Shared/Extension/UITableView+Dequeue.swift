//
//  UITableView+Dequeue.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeue<T: UITableViewCell>(_ reusable: T.Type = T.self, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Cell \(T.identifier) is not registered - call tableView.register(Cell.Type) to register first before using.")
        }
        return cell
    }
    
}
