//
//  DetailViewController.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var interactor: DetailInteractorInput!
    var router: DetailRouterProtocol!
    var sectionScreens:[SectionScreens]?
    
    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailWireframe.configurate(viewcontroller: self)
        self.showLoading()
        self.interactor.loadDetail()
    }
    
    @IBAction func btnInvestTapped(_ sender: ButtonStyle) {
    }
    
    @IBAction func btnFormTapped(_ sender: ButtonStyle) {
        performSegue(withIdentifier: "sgForm", sender: nil)
    }
    
    private func loadXib() {
        FundNameTableViewCell.register(to: self.tbView)
        AboutTableViewCell.register(to: self.tbView)
        RiskTableViewCell.register(to: self.tbView)
        MoreInfoTableViewCell.register(to: self.tbView)
        InfoTableViewCell.register(to: self.tbView)
        DownInfoTableViewCell.register(to: self.tbView)
        
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.tbView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController: DetailPresenterProtocol {
    
    func loadDetail(sectionScreen:[SectionScreens]) {
        self.sectionScreens = sectionScreen
        self.loadXib()
        self.hideLoading()
    }
    
    func failureView(msg:String) {
        self.alertMesage(title: "Teste", msg: msg, btn: "OK")
        self.hideLoading()
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionScreens!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let screenSection = self.sectionScreens {
            return screenSection[section].rows
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let screenSection = self.sectionScreens {
            
            switch indexPath.section {
            case 0 :
                if let fundName = screenSection[0].fundName {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "FundNameTableViewCell", for: indexPath) as! FundNameTableViewCell
                    cell.setup(fund: fundName)
                    return cell
                }
            case 1:
                if let about = screenSection[1].whatId {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
                    cell.setup(about: about)
                    return cell
                }
            case 2:
                if let risk = screenSection[2].riskScreen {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "RiskTableViewCell", for: indexPath) as! RiskTableViewCell
                    cell.setup(riskObj: risk)
                    return cell
                }
            case 3:
                if let moreInfo = screenSection[3].moreInformation {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "MoreInfoTableViewCell", for: indexPath) as! MoreInfoTableViewCell
                    cell.setup(obj: moreInfo)
                    return cell
                }
            case 4:
                if let objInfo = screenSection[4].info {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
                    cell.setup(obj: objInfo[indexPath.row])
                    return cell
                }
            case 5:
                if let downInfo = screenSection[5].downInfo {
                    let cell = self.tbView.dequeueReusableCell(withIdentifier: "DownInfoTableViewCell", for: indexPath) as! DownInfoTableViewCell
                    cell.delegate = self
                    cell.setup(obj: downInfo[indexPath.row])
                    return cell
                }
            default:
                return UITableViewCell()
            }
            
        }
        
        return UITableViewCell()
    }
    
}

extension DetailViewController: DownInfoTableViewCellDelegate {
    
    func openSafari() {
        self.router.routerToSafari()
    }
    
}
