//
//  DetailViewController.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var interactor: DetailInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailWireframe.configurate(viewcontroller: self)
        self.interactor.loadDetail()
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
extension DetailViewController: DetailPresenterProtocol {
    
    func loadDetail(screen:Screen) {
        
    }
    
    func failureView(msg:String) {
        
    }
    
}
