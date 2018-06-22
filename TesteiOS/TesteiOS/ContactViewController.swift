//
//  ViewController.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/16/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ContactViewController: UIViewController {
    
    


    
    let URL = "https://floating-mountain-50292.herokuapp.com/cells.json"
    let contactDataModel = ContactDataModel()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var textButtonLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabBarItem.title = "Teste"
        getContactData(url: URL)
        
        sendButton.layer.cornerRadius = 25
        
//                self.removeTabbarItemsText()


    }

    
    
//    func removeTabbarItemsText() {
//        if let items = tabBarController?.tabBar.items {
//            for item in items {
//                item.title = ""
//                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
//            }
//        }
//    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
    }
    
    
    //MARK: - Networking
    /*********************************************************************/
    func getContactData(url: String) {
        
        // retrieve data from an HTTP request
        Alamofire.request(url, method: .get).responseJSON {
            // once the response comes back
            response in
            if response.result.isSuccess {
                print("Success! Got the data!")
                let contactJSON : JSON = JSON(response.result.value!)
                self.updateContactData(json: contactJSON)
                
                
            }
            // if it did not manage to get the data
            else {
                print("Error: \(response.result.error!)")
            }
        }
    }
    
    
    
    //MARK: - JSON parsing
    /*********************************************************************/
    func updateContactData(json: JSON) {
        
        
        contactDataModel.name = json["cells"][1]["message"].stringValue
        contactDataModel.email = json["cells"][2]["message"].stringValue
        contactDataModel.phone = json["cells"][3]["message"].stringValue
        contactDataModel.textButton = json["cells"][4]["message"].stringValue
        
        updateUIWithContactData()
        
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithContactData() {
        nameLabel.text = contactDataModel.name
        emailLabel.text = contactDataModel.email
        phoneLabel.text = contactDataModel.phone
        textButtonLabel.text = contactDataModel.textButton
    }
    
    

}

