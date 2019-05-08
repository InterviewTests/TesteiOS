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
    var router: DetailRouterProtocol!
    var sectionScreens:[SectionScreens]?
    
    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailWireframe.configurate(viewcontroller: self)
        self.interactor.loadDetail()
    }
    
    @IBAction func btnInvestTapped(_ sender: ButtonStyle) {
    }
    
    @IBAction func btnFormTapped(_ sender: ButtonStyle) {
        performSegue(withIdentifier: "sgForm", sender: nil)
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
    
    func loadDetail(sectionScreen:[SectionScreens]) {
        self.sectionScreens = sectionScreen
    }
    
    func failureView(msg:String) {
        self.alertMesage(title: "Teste", msg: msg, btn: "OK")
    }
    
}
