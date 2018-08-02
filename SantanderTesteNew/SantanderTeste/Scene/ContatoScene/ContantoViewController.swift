//
//  ContantoViewController.swift
//  SantanderTeste
//
//  Created by Nayara on 05/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import UIKit
import Alamofire

class ContantoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var reload = false
    
    @IBOutlet weak var viewFeedBack: UIView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var loadingAnimation: UIActivityIndicatorView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewFeedBack.isHidden = true
        self.loadingAnimation.startAnimating()
        self.downloadPage()
        
     //   self.tableView.keyboardDismissMode = .interactive
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadDataFromModel()
        
    }
    func downloadPage(){
        NetworkManager.shared.request_Contato {

            self.viewLoading.removeFromSuperview()
            self.loadingAnimation.stopAnimating()
            self.reload = true
            self.reloadDataFromModel()
        }
    }
    
    @IBAction func investimentoBack(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func backContato(_ sender: Any) {
        self.viewFeedBack.isHidden = true
    }
    
    @IBAction func contatoSegment(_ sender: Any) {
        self.viewFeedBack.isHidden = true

    }
    

}
extension ContantoViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func reloadDataFromModel(_ refreshTable: Bool = true){
        
        if refreshTable{
            self.tableView.reloadData()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if reload{
            return dataCell.cells.count
            
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ContatoTableViewCell
        
        cell.getObjetos = self
        
        if dataCell.cells[indexPath.row].type == 1{
            cell.campodeText = dataCell.cells[indexPath.row]
            cell.campodeTexto.delegate = self
            
        }else if dataCell.cells[indexPath.row].type == 2{
            cell.messageText = dataCell.cells[indexPath.row]
            
        }else if dataCell.cells[indexPath.row].type == 4{
            cell.checkButton = dataCell.cells[indexPath.row]
            
        }else if dataCell.cells[indexPath.row].type == 5{
            cell.enviarButton = dataCell.cells[indexPath.row]
            
            
        }
        
        return cell
    }
    

    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
   
}
extension ContantoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
