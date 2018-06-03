//
//  FormViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITableViewDataSource {

    final let formURL = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
    var cells : FormDataModel? = nil
    
    @IBOutlet weak var formTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.formTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.formTableView.rowHeight = UITableViewAutomaticDimension
        self.formTableView.estimatedRowHeight = 20.0
        
        downloadJson { (cells) in
            self.cells = cells
            DispatchQueue.main.async {
                self.formTableView.reloadData()
            }
        }

    }
    func downloadJson(onComplete: @escaping (FormDataModel) -> Void) {
        guard let downloadURL = formURL else {return}
        URLSession.shared.dataTask(with: downloadURL) {data, urlResponse, error in
            if error == nil {
                guard let urlResponse = urlResponse as? HTTPURLResponse else {return}
                if urlResponse.statusCode == 200 {
                    guard let data = data else {return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let downloadedScreen = try decoder.decode(FormDataModel.self, from: data)
                        onComplete(downloadedScreen)
                    } catch{
                        print("something wrong after downloading")
                    }
                } else {return}
            } else {return}
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cells != nil {
            return (cells?.cells.count)!
        } else {
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (cells?.cells[indexPath.row].type == Cell.CellTypes.text.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else {return
                UITableViewCell()}
            
            cell.formTextLbl.text = cells?.cells[indexPath.row].message
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.checkbox.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxTableViewCell") as? CheckboxTableViewCell else {return
                UITableViewCell()}
            
            cell.checboxLbl.text = cells?.cells[indexPath.row].message
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.image.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell else {return
                UITableViewCell()}
            
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.field.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FieldTableViewCell") as? FieldTableViewCell else {return
                UITableViewCell()}
            
            
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.send.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as? ButtonTableViewCell else {return
                UITableViewCell()}
            
            cell.sendBtn.setTitle(cells?.cells[indexPath.row].message, for: .normal)
            
            cell.selectionStyle = .none
            return cell
        }
        
        
      return UITableViewCell()
    }
}
