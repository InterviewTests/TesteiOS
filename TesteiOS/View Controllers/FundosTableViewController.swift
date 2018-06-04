//
//  FundosTableViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import RxSwift

class FundosTableViewController: UITableViewController,LoadWebView {
    
    var data:[Any] = []
    let disposeBag = DisposeBag()
    var apiFetcher: Fetcher?
    var screen:Screen?
    var count:Int = 99
    var countMore:Int = 999
    
    @IBOutlet var uiTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiTableView?.delegate = self
        
        layoutTableView()
        apiFetcher?.fetch(request: Router.FinanceActive.get(params: "").asURLRequest()) { data in
            
            
            guard let data = data as? Data else {
                print("Error: No data to decode")
                return
            }
            
            let decoder = InvestDecoder(data:data)
            self.screen = decoder.decode()
            guard let c = self.screen?.info.count,
                let cM  = self.screen?.downInfo.count else {
                return
            }
            self.count = c + 13
            self.countMore = self.count + cM
            print("COUNTTT")
            print(self.count)
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
        return self.countMore + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let s = screen else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "TitleLabelCell",for: indexPath) as? TitleTableViewCell
            cell?.model = TitleCellModel(screen)
            cell?.title = 0
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
            cell?.title = 1
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
            cell?.title = 2
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
            cell?.title = 3
            cell?.setLayout()
            return cell!
        case 8:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "HeaderLabelsCell",for: indexPath) as? HeaderLabelsTableViewCell
            return cell!
        case 9:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell
            cell?.model = ThreeLabelCellModel("No mês",String(describing: s.moreInfo.month.fund),String(describing: s.moreInfo.month.CDI),nil)
            cell?.setLayout()
            return cell!
        case 10:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell
            cell?.model = ThreeLabelCellModel("No ano",String(describing: s.moreInfo.year.fund),String(describing: s.moreInfo.year.CDI),nil)
            cell?.setLayout()
            return cell!
        case 11:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell
            cell?.model = ThreeLabelCellModel("12 meses",String(describing: s.moreInfo.allMonths.fund),String(describing: s.moreInfo.allMonths.CDI),nil)
            cell?.setLayout()
            return cell!
        case 12:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "SeparatorCell",for: indexPath)
            return cell!
        case 13...self.count:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell
            if indexPath.row - 13 < s.info.count {
            cell?.model = ThreeLabelCellModel(s.info[indexPath.row - 13].name,"",s.info[indexPath.row - 13].data,nil)
            }
            cell?.setLayout()
            return cell!
        case self.count...self.countMore:
            let cell = uiTableView?.dequeueReusableCell(withIdentifier: "ThreeLabelTableViewCell",for: indexPath) as? ThreeLabelTableViewCell

            if indexPath.row - self.count - 1 < s.downInfo.count {
                cell?.model = ThreeLabelCellModel(s.downInfo[indexPath.row - self.count - 1].name,"",s.downInfo[indexPath.row - self.count - 1].data,"https://www.google.com")
            }
            cell?.delegate = self
            cell?.setLayout()
            return cell!
        
        //case data.count - 1
        //redButtonCell
        default:
            return UITableViewCell()
        }
        
    }
    func loadNewScreen(controller: UIViewController) {
        self.present(controller, animated: true, completion: nil)
    }
    
}
