//
//  FundosTableViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import RxSwift

class FundosTableViewController: UITableViewController {

    var data:[Any] = []
    let disposeBag = DisposeBag()
    var apiFetcher: Fetcher?
    var screen:Screen?
    @IBOutlet var uiTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiTableView?.delegate = self
        
        layoutTableView()
        apiFetcher?.fetch(request: Router.FinanceActive.get(params: "").asURLRequest()) { data in
            print(data)
            
            guard let data = data as? Data else {
                print("Error: No data to decode")
                return
            }
            
            let decoder = InvestDecoder(data:data)
            self.screen = decoder.decode()
            print(self.screen?.title)
            self.uiTableView?.reloadData()
            
        }
    }
        
        func layoutTableView() {
            uiTableView?.register(UINib(nibName: "ThreeLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreeLabelTableViewCell")
            uiTableView?.register(UINib(nibName: "SeparatorCell", bundle: nil), forCellReuseIdentifier: "SeparatorCell")
            uiTableView?.register(UINib(nibName: "RiskInvestimentCell", bundle: nil), forCellReuseIdentifier: "RiskInvestimentCell")
            uiTableView?.register(UINib(nibName: "TitleLabelCell", bundle: nil), forCellReuseIdentifier: "TitleLabelCell")
            uiTableView?.register(UINib(nibName: "NameLabelCell", bundle: nil), forCellReuseIdentifier: "NameLabelCell")
            uiTableView?.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
            uiTableView?.register(UINib(nibName: "HeaderLabelsCell", bundle: nil), forCellReuseIdentifier: "HeaderLabelsCell")
            uiTableView?.register(UINib(nibName: "LargeButtonCell", bundle: nil), forCellReuseIdentifier: "LargeButtonCell")
        }
//        Observable.of(self.years).bind(to: table.rx.items(cellIdentifier:"yearCell",cellType:PaymentYieldTableViewCell.self)) {
//            (row,element,cell) in
//            cell.loadItem(date:element.year, reason:element.reason)
//            }.disposed(by:self.disposeBag)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch  indexPath.row {
        case 4:
            return 100
        case 6:
            return 100
        default:
            return 30
        }

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //11 + numberOfItens.count
        return 11
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TitleLabelCell",for: indexPath) as? TitleTableViewCell
            cell?.model = TitleCellModel(screen)
            cell?.setLayout()
            return cell!
        case 1:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "NameLabelCell",for: indexPath) as? NameTableViewCell
            cell?.model = NameCellModel(screen)
            cell?.setLayout()
            return cell!
        case 2:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "SeparatorCell",for: indexPath)
            return cell!
        case 3:
            
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TitleLabelCell",for: indexPath) as? TitleTableViewCell
            cell?.model = TitleCellModel(screen)
            cell?.setLayout()
            return cell!
        case 4:
                        
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TextCell",for: indexPath) as? TextTableViewCell
                cell?.model = TextCellModel(screen)
                cell?.setLayout()
            return cell!
        case 5:
            
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TitleLabelCell",for: indexPath) as? TitleTableViewCell
            cell?.model = TitleCellModel(screen)
            cell?.setLayout()
            return cell!
        case 6:
            
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "RiskInvestimentCell",for: indexPath) as? RiskTableViewCell
            cell?.model = RiskCellModel(screen)
            cell?.setLayout()
            return cell!
        case 7:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TitleLabelCell",for: indexPath) as? TitleTableViewCell
            cell?.model = TitleCellModel(screen)
            cell?.setLayout()
            return cell!
        case 8:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "HeaderLabelsCell",for: indexPath) as? HeaderLabelsTableViewCell
            return cell!
        case 9...11:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell
            cell?.model = ThreeLabelCellModel("",0,0,"")
            cell?.setLayout()
            return cell!
        case 12:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "SeparatorCell",for: indexPath)
            return cell!
        case 13...19:
            return UITableViewCell()
        //case data.count - 1
        //redButtonCell
        default:
            return UITableViewCell()
        }
        
    }
}
