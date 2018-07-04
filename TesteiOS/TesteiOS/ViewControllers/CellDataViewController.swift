//
//  CellViewController.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/3/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class CellDataViewController: UIViewController {

    // URL constant
    let URL = "https://floating-mountain-50292.herokuapp.com/cells.json"
    
    // variables to handle Json data
    var cells = [Cell]()
    var namePosition = -1
    var telNumberPosition = -1
    var emailPosition = -1
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var line1: Line!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textFIeld2: UITextField!
    
    @IBOutlet weak var line2: Line!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData(url: URL)
    }

    
    //MARK: - Networking
    /*********************************************************************/
    public func getData(url: String) {
        
        // retrieve data from an HTTP request
        Alamofire.request(url, method: .get).responseJSON {
            // once the response comes back
            response in
            if response.result.isSuccess {
                let dataJSON : JSON = JSON(response.result.value!)
                self.updateData(json: dataJSON)
            }
                // if it did not manage to get the data
            else {
                print("Error: \(response.result.error!)")
            }
        }
    }
    
    
    //MARK: - JSON parsing
    /*********************************************************************/
    func updateData(json: JSON) {
        
        for item in 0..<json["cells"].count {
            
            let newCell = Cell()
            
            newCell.id = json["cells"][item]["id"].intValue
            newCell.type = Type(rawValue: json["cells"][item]["type"].intValue)
            newCell.message = json["cells"][item]["message"].stringValue
            newCell.typefield = TypeField(rawValue: json["cells"][item]["typefield"].intValue)            
            newCell.hidden = json["cells"][item]["hidden"].boolValue
            newCell.topSpacing = json["cells"][item]["topSpacing"].doubleValue
            newCell.show = json["cells"][item]["show"].intValue
            newCell.required = json["cells"][item]["required"].boolValue

            cells.append(newCell)
        }
        
        updateUIWithData()
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithData() {
        
        namePosition = lookFor(key: "name", array: cells)!
        //telNumberPosition = lookFor(key: "telNumber", array: cells)! JSON file non compliant with typefield specification
        emailPosition = lookFor(key: "email", array: cells)!
        
        label1.text = cells[namePosition].message
        label2.text = cells[2].message
        
        

    }
    
    
    private func lookFor(key: String, array: [Cell]) -> Int? {
        
        let size = array.count
        var dict : [String : Int] = ["name" : 1, "telNumber": 2, "email" : 3]
        
        for item in 0..<size {
            if (array[item].typefield?.rawValue == dict[key]) {
                print(item)
                return item
            } else {
                print("Key not found in array")
            }
        }
        return nil
    }
    
    



}
