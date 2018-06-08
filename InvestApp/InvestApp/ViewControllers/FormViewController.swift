//
//  SendContactViewController.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    let viewModel = FormViewModel(
    )
    override func viewDidLoad() {
        super.viewDidLoad()

        APIService.fetchJsonData(with: Constants.formJsonURL) { (formData: FormData?, result) in

            if let formData = formData {
                let viewCreator = FormViewCreator(rootView: self.view)
                _ = viewCreator.visit(node: formData)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
