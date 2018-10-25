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
    @IBOutlet weak var imageSair: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 44.0
        self.setUp()
    }
    
    private func setUp(){
        self.imageSair.image = UIImage(named: Login.imageSair)
    }
    private func setUpHeader(headerView: UIView){
        
        headerView.backgroundColor = UIColor(red:0.97, green:0.98, blue:0.98, alpha:1.0)
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        headerLabel.textColor = UIColor(red:0.28, green:0.33, blue:0.40, alpha:1.0)
        headerLabel.text = "Recentes"
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
    }
}

extension UserDataViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell") as! UserDataTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        self.setUpHeader(headerView: headerView)
        return headerView
    }
    
    
}
