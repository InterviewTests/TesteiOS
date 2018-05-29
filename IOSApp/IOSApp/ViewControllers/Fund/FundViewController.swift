//
//  FundViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class FundViewController: UIViewController {
    let FUND_API_URL = "https://floating-mountain-50292.herokuapp.com/fund.json"
    
    @IBOutlet weak var fundTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getFundData(url: FUND_API_URL) { (response) in
            if (response != nil) {
                let vm = FundViewModel(data: response!)
                DispatchQueue.main.async(execute: {() -> Void in
                
                    self.fundTableView?.dataSource = vm
                    self.fundTableView?.reloadData()
                
                })
            }
        }
        
        fundTableView?.estimatedRowHeight = 200
        fundTableView?.rowHeight = UITableViewAutomaticDimension
        
        fundTableView?.register(FundTitleAndNameTableViewCell.self, forCellReuseIdentifier: FundTitleAndNameTableViewCell.identifier)
        fundTableView?.register(FundDefinitionTableViewCell.self, forCellReuseIdentifier: FundDefinitionTableViewCell.identifier)
        fundTableView?.register(FundRiskTableViewCell.self, forCellReuseIdentifier: FundRiskTableViewCell.identifier)
        fundTableView?.register(FundMoreInfoTableViewCell.self, forCellReuseIdentifier: FundMoreInfoTableViewCell.identifier)
        fundTableView?.register(FundInfoTableViewCell.self, forCellReuseIdentifier: FundInfoTableViewCell.identifier)
        fundTableView?.register(FundDownInfoTableViewCell.self, forCellReuseIdentifier: FundDownInfoTableViewCell.identifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getFundData(url: String, completionBlock: @escaping (FundDataModel?)->Void) {
        
        guard let fundUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: fundUrl) { (data, response
            , error) in
            guard let data = data else { return }
            var response : FundDataModel?
            do {
                let decoder = JSONDecoder()
                response = try decoder.decode(FundDataModel.self, from: data)
            } catch let err {
                response = nil
                print("Err", err)
            }
            completionBlock(response)
        }.resume()
    }

}
