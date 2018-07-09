//
//  ContatoTableViewController.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/7/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

class ContatoTableViewController: UITableViewController, FormTableViewCellDelegate {
    var cellList: CellList? = CellList()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Contato"
        self.tabBarController?.setSelectionIndicatorColor(color: UIColor.selectedRed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)?.replacingOccurrences(of: "\"telnumber\"", with: "2")
            print(jsonString ?? "Erro")
            
            do {
                defer {
                    DispatchQueue.main.sync{
                        self.tableView.reloadData()
                    }
                }
                
                let decoder = JSONDecoder()
                self.cellList = try decoder.decode(CellList.self, from: jsonString!.data(using: .utf8)!)
//                self.cellList!.cells = self.cellList!.cells.filter({!$0.hidden})
                print("")
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func showCell (id: Int) {
        for index in 0..<self.cellList!.cells.count where self.cellList!.cells[index].id == id {
            self.cellList!.cells[index].hidden = !self.cellList!.cells[index].hidden
            break
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellList!.cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var reuseIdentifier: String = ""
        let cellModel = self.cellList!.cells[indexPath.row]
        
        switch cellModel.type {
        case Cell.CellType.field.rawValue:
            reuseIdentifier = "FieldTableViewCell"
        case Cell.CellType.text.rawValue:
            reuseIdentifier = "TextTableViewCell"
        case Cell.CellType.checkbox.rawValue:
            reuseIdentifier = "CheckboxTableViewCell"
        case Cell.CellType.button.rawValue:
            reuseIdentifier = "ButtonTableViewCell"
        default:
            ()
        }
        
        let cell: FormTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FormTableViewCell
        cell.update(self, cell: cellModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cell: Cell = self.cellList?.cells[indexPath.row], cell.hidden {
            return 0
        }
        
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let formCell: FormTableViewCell = tableView.cellForRow(at: indexPath) as? FormTableViewCell {
            if let cellModel: Cell = formCell.cell {
                if let id: Int = cellModel.show {
                    self.showCell(id: id)
                }
                
                if cellModel.type == Cell.CellType.checkbox.rawValue {
                    formCell.toggleCheck()
                }
            }
        }
        tableView.reloadData()
    }
    
    
    // MARK: - FormTableViewCellDelegate
    
    func buttonClicked() {
        var formValidInput: Bool = true
        
        for index in 0..<self.cellList!.cells.count {
            if let formCell: FormTableViewCell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? FormTableViewCell {
                formValidInput = formValidInput && formCell.validateInput()
            }
        }

        if formValidInput {
            performSegue(withIdentifier: "segueSucessoViewController", sender: nil)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
