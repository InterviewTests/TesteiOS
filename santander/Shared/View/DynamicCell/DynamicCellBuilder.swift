//
//  DynamicCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class DynamicCellBuilder: TableViewCellBuilder {
    
    private var response: Form
    
    init(response: Form) {
        self.response = response
    }
    
    public var cellHeight: CGFloat {
        
        switch response.field {
        case .field:
            return 56
        case .text:
            return 56
        case .image:
            return 0
        case .checkbox:
            return 19
        case .send:
            return 50
        }
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(DynamicCell.self,
                           forCellReuseIdentifier: DynamicCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: DynamicCell = tableView.dequeue(indexPath: indexPath)
        var view: UIView?
        
        switch response.field {
        case .field:
            view = SATextField(titled: response.message)
            (view as? SATextField)?.keyboardType =
                getKeyboardType(from: response.fieldType)
        case .text:
            view = SimpleTextView(configuration:
                .init(title: response.message))
        case .image:
            view = nil
        case .checkbox:
            view = SACheckbox(configuration:
                .init(title: response.message))
        case .send:
            view = SAButton(titled: response.message)
        }
        
        cell.configure(data: .init(containerView: view))
        
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
    
}

extension DynamicCellBuilder {
    
    private func getKeyboardType(from fieldType: FormFieldType?) -> UIKeyboardType? {
        
        guard let fieldType = fieldType else {
            return .default
        }
        
        switch fieldType {
        case .text:
            return .default
        case .telNumber:
            return .phonePad
        case .email:
            return .emailAddress
        }
        
    }
    
}
