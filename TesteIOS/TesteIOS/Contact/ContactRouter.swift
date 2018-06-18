//
//  ContactRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol ContactRoutingLogic {
    func prepareToRouter(cells: [Cell])
}

class ContactRouter: NSObject, ContactRoutingLogic {
    weak var viewController: ContactViewController?
    
    
    func routeToSuccessView() {
        viewController?.delegate?.displaySuccessView()
    }
    
    func prepareToRouter(cells: [Cell]){
        var isValid = false

        if let controller = viewController {
            for (index, cell) in cells.enumerated() {
                if cell.type! == .field && cell.required! && !cell.hidden! {
                    let cell = controller.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! TextFieldTableViewCell
                    if !cell.isValid {
                        AlertViewUtil.createAlertView(viewController: controller, message: ErrorMessenger.validateError) {}
                        isValid = false
                        return
                    }
                    isValid = true
                }
            }
            if isValid {
                self.routeToSuccessView()
            }
        }
    }
}
