//
//  InvestimentoViewController.swift
//  SantanderTeste
//
//  Created by Nayara on 05/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import UIKit
import Alamofire

class InvestimentoViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleInvest: UILabel!
    @IBOutlet weak var fundName: UITextView!
    @IBOutlet weak var whatIs: UILabel!
    @IBOutlet weak var definition: UITextView!
    @IBOutlet weak var risktitle: UILabel!
    @IBOutlet weak var infotitle: UILabel!
    @IBOutlet weak var fundoMes: UILabel!
    @IBOutlet weak var cdiMes: UILabel!
    @IBOutlet weak var fundoAno: UILabel!
    @IBOutlet weak var cdiAno: UILabel!
    @IBOutlet weak var fundo12meses: UILabel!
    @IBOutlet weak var cdi12meses: UILabel!
    @IBOutlet weak var barraIndicação: UISlider!
    
    
    
    
    @IBOutlet weak var verde: UIImageView!
    
    @IBOutlet weak var verdeescuro: UIImageView!
    
    @IBOutlet weak var amarelo: UIImageView!
    
    @IBOutlet weak var laranja: UIImageView!
    
    @IBOutlet weak var vermelhoo: UIImageView!
    
    
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    

    var reload = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.loading.startAnimating()
        self.downloadPage()
        self.barraIndicação.setThumbImage( #imageLiteral(resourceName: "Group Copy 10"), for: .normal)
        self.barraIndicação.minimumTrackTintColor = UIColor.clear
        self.barraIndicação.maximumTrackTintColor = UIColor.clear
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadDataFromModel()
        
    }
    
    func firtloadview(){
        print(dataScreen.screen.definition)
        self.titleInvest.text = dataScreen.screen.title
        self.fundName.text = dataScreen.screen.fundName
        self.whatIs.text = dataScreen.screen.whatIs
        self.definition.text = dataScreen.screen.definition
        self.risktitle.text = dataScreen.screen.riskTitle
        self.infotitle.text = dataScreen.screen.infoTitle
        switch(dataScreen.screen.risk){
        case 1: verde.frame.size.height = 10
        case 2: verdeescuro.frame.size.height = 10
        case 3: amarelo.frame.size.height = 10
        case 4: laranja.frame.size.height = 10
        case 5: vermelhoo.frame.size.height = 10
            
        case .none:
            print("nome")
        case .some(_):
            print("some")
        }
        self.fundoMes.text = "\(dataScreen.screen.moreInfo.month.fund!)%"
        self.cdiMes.text = "\(dataScreen.screen.moreInfo.month.CDI!)%"
        self.fundoAno.text = "\(dataScreen.screen.moreInfo.year.fund!)%"
        self.cdiAno.text = "\(dataScreen.screen.moreInfo.year.CDI!)%"
        self.fundo12meses.text = "\(dataScreen.screen.moreInfo.months.fund!)%"
        self.cdi12meses.text = "\(dataScreen.screen.moreInfo.months.CDI!)%"
        reloadDataFromModel()
    }
    func animar(image: UIImageView){
        UIView.animate(withDuration: 0.5) {
            image.frame.size.height = 10
        }
    }
    
}
extension InvestimentoViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func reloadDataFromModel(_ refreshTable: Bool = true){
        
        if refreshTable{
            self.tableView.reloadData()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if reload{
            switch section{
            case 0: return dataScreen.screen.info.count
            case 1: return dataScreen.screen.downInfo.count
            default: return 0
            }
            //return data.screen.info.count + data.screen.downInfo.count
            
            //            print("OLA")
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInvest", for: indexPath) as! InvestimentoTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.informacao.text = dataScreen.screen.info[indexPath.row].name!
            cell.dados.text = dataScreen.screen.info[indexPath.row].data!
            
        case 1:
            cell.informacao.text = dataScreen.screen.downInfo[indexPath.row].name!
            cell.dados.isHidden = true
            cell.baixar.isHidden = false
            cell.baixar.isEnabled = true
            
        default:
            print("Section Erro")
        }
        
        
        
        return cell
    }
    
    func downloadPage(){
        NetworkManager.shared.request_Investimento {
            
            self.viewLoading.removeFromSuperview()
            self.loading.stopAnimating()
            self.reload = true
            self.firtloadview()
            self.barraIndicação.value = Float((dataScreen.screen.risk) + ((dataScreen.screen.risk) - 1))
        }
    }
}
