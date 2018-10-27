//
//  UserDataViewController.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 24/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelConta: UILabel!
    @IBOutlet weak var labelSaldo: UILabel!
    @IBOutlet weak var ButtonSair: UIButton!
    
    var user : UserAccount? = nil
    var statements : [Statement] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 44.0
        self.setUp()
        self.loadHeader(user: user)
    }
     
    private func setUp(){
        let image = UIImage(named: Login.imageSair)
        self.ButtonSair.setImage(image, for: .normal)
    }
   
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadHeader (user: UserAccount?){
        self.labelNome.text = user?.userAccount.name
        self.labelConta.text = "\(user?.userAccount.bankAccount ?? "") / \(user?.userAccount.agency ?? "")"
        
        if let balance = user?.userAccount.balance {

            self.labelSaldo.text = "R$ \(String(format:"%.2f", balance))"
        }else{
            self.labelSaldo.text = ""
        }
    }
}

extension UserDataViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell") as! UserDataTableViewCell
        cell.loadCell(values: statements[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        setUpHeader(headerView: headerView)
        return headerView
    }
    
    
}
