//
//  Notices.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 16/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class Notices: NSObject {
    static func showAlert(title: String, message: String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Entendi", style: .default, handler: nil))
        target.present(alert, animated: true, completion: nil)
    }
}
