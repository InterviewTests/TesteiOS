//
//  FormViewController.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    var interactor: FormInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FormWireframe.configurate(viewcontroller: self)
        self.interactor.loadForm()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FormViewController: FormPresenterProtocol {
    
    func loadForm(listCell:[CellList]) {
        
    }
    
    func failureView(msg:String) {
        
    }
    
}
