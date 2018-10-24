//
//  FundViewController.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit
import SVProgressHUD
import SafariServices

class FundViewController: UIViewController {
    
    //
    // MARK: - SETUP DE VARIÁVEIS LOCAIS
    //
    var fundFields: FundModel?
    var URL_Fund = String()
    var shareURL = String()
    var titulo = ""
    var tableRowsSum = 0

    //
    // MARK: - SETUP DE GANCHOS IBOUTLET
    //
    @IBOutlet weak var Label_Titulo: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // ajusta o estilo do SVProgressHUD para dark
        SVProgressHUD.setDefaultStyle(.dark)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Label_Titulo.text = titulo
        
        // se ainda não carregou o JSON de fundos
        if fundFields == nil{
            fetchFundFields(forURL: URL_Fund, completionHandler: { (resultado, mensagem) in
                if !resultado{
                    DispatchQueue.main.async {
                        self.showAlert(title: Constants.Investments.loadErrorTitle, body: Constants.Investments.loadErrorMessage, buttonText: Constants.okButtonText)
                    }
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK: - FORM FIELDS FETCH
    //
    
    func fetchFundFields( forURL: String, completionHandler: @escaping (Bool, String) -> Void){
        let localFundAPI = FundAPI()
        
        tableView.reloadData()
        
        SVProgressHUD.show(withStatus: Constants.loadingMessage)
        
        localFundAPI.fetchFundData(URL: forURL,
           completionHandler: { (fundFields) in
                SVProgressHUD.dismiss()
                self.fundFields = fundFields!
                
                // atualizar o total de linhas da tabela
                self.tableRowsSum = 27
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }) { (messageError) in
            SVProgressHUD.dismiss()
            completionHandler(false, messageError!)
        }
    }
    
    @IBAction func OpenSafari(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string: shareURL)!)
        self.present(svc, animated: true, completion: nil)
    }
}

extension FundViewController: UITableViewDelegate, UITableViewDataSource{
    //
    // MARK: - TABLEVIEW DELEGATE FUNCTIONS
    //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableRowsSum
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        switch row {
        case 0: // Title
            return 30
        case 1: // Fundname
            return 100
        case 2: // Separador
            return 20
        case 3: // Whatis
            return 35
        case 4: // Definition
            return 90
        case 5: // Risktitle
            return 35
        case 6: // RiskIndicator
            return 30
        case 7: // RiskGauge
            return 12
        case 8: // Infotitle
            return 40
        case 9: // Fund Performance Header
            return 35
        case 10, 11, 12: // Moreinfo
            return 35
        case 13: // Separador 2
            return 2
        case 14, 15, 16, 17, 18, 19, 20: // Info
            return 35
        case 21, 22, 23, 24, 25: // Moreinfo
            return 35
        case 26: // botão
            return 90
        default:
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        switch row {
        case 0: // Title
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Title", for: indexPath) as! TVC_Title_TableViewCell
            
            if let thisFund = fundFields {
                cell.Title.text = thisFund.screen.title
            }
            
            return cell
        case 1: // Fundname
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Fundname", for: indexPath) as! TVC_Fundname_TableViewCell
            if let thisFund = fundFields {
                cell.FundName.text = thisFund.screen.fundName
            }
            return cell
        case 2: // Separador
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Separador", for: indexPath) as! TVC_Separador_TableViewCell
            return cell
        case 3: // Whatis
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Whatis", for: indexPath) as! TVC_Whatis_TableViewCell
            
            if let thisFund = fundFields {
                cell.Whatis.text = thisFund.screen.whatIs
            }
            
            return cell
        case 4: // Definition
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Definition", for: indexPath) as! TVC_Definition_TableViewCell
            
            if let thisFund = fundFields {
                cell.Definition.text = thisFund.screen.definition
            }
            
            return cell
        case 5: // Risktitle
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Risktitle", for: indexPath) as! TVC_Risktitle_TableViewCell
            
            if let thisFund = fundFields {
                cell.Risktitle.text = thisFund.screen.riskTitle
            }
            
            return cell
        case 6: // RiskIndicator
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_RiskIndicator", for: indexPath) as! TVC_RiskIndicator_TableViewCell
            
            if let thisFund = fundFields {
                cell.setRiskIndicator(index: thisFund.screen.risk)
            }
            
            return cell
        case 7: // GaugeIndicator
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_RiskGauge", for: indexPath) as! TVC_RiskGauge_TableViewCell
            
            if let thisFund = fundFields {
                cell.setGauge(index: thisFund.screen.risk)
            }
            
            return cell
        case 8: // Infotitle
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Infotitle", for: indexPath) as! TVC_Infotitle_TableViewCell
            
            if let thisFund = fundFields {
                cell.Infotitle.text = thisFund.screen.infoTitle
            }
            
            return cell
        case 9: // Fund Performance Header
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_FundPerformanceHeader", for: indexPath) as! TVC_FundPerformanceHeader_TableViewCell
            return cell
        case 10: // More Info Mês
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Moreinfo", for: indexPath) as! TVC_Moreinfo_TableViewCell
            cell.Periodo.text = Constants.Investments.View.month
            
            if let thisFund = fundFields {
                cell.Fundo.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.month.fund)) %"
                cell.CDI.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.month.cdi)) %"
            }
            
            return cell
        case 11: // More Info Ano
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Moreinfo", for: indexPath) as! TVC_Moreinfo_TableViewCell
            cell.Periodo.text = Constants.Investments.View.year
            
            if let thisFund = fundFields {
                cell.Fundo.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.year.fund)) %"
                cell.CDI.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.year.cdi)) %"
            }
            
            return cell
        case 12: // More Info 12 meses
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Moreinfo", for: indexPath) as! TVC_Moreinfo_TableViewCell
            cell.Periodo.text = Constants.Investments.View.the12months
            
            if let thisFund = fundFields {
                cell.Fundo.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.the12Months.fund)) %"
                cell.CDI.text = "\(String(format: Constants.Investments.View.fundFormat, thisFund.screen.moreInfo.the12Months.cdi)) %"
            }
            
            return cell
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Separador2", for: indexPath) as! TVC_Separador2_TableViewCell
            return cell
        case 14, 15, 16, 17, 18, 19, 20:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Info", for: indexPath) as! TVC_Info_TableViewCell
            
            if let thisFund = fundFields {
                cell.Name.text = thisFund.screen.info[row - 14].name
                cell.Data.text = thisFund.screen.info[row - 14].data
            }
            
            return cell
        case 21, 22, 23, 24, 25:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Downinfo", for: indexPath) as! TVC_Downinfo_TableViewCell
            
            if let thisFund = fundFields {
                cell.Name.text = thisFund.screen.downInfo[row - 21].name
            }
            
            return cell
        case 26:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Button", for: indexPath) as! TVC_Button_TableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_Title", for: indexPath) as UITableViewCell
            _ = 0
            return cell
        }
    }
    
}
