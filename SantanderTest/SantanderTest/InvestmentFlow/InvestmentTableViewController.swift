//
//  InvestmentTableViewController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit
import SafariServices

extension InvestmentTableViewController: SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: false)
    }
}

extension InvestmentTableViewController: InvestmentDownInfoCellDelegate
{
    func onDownload()
    {
        if let url = URL(string: "https://www.google.com")
        {
            let controller: SFSafariViewController = .init(url: url, entersReaderIfAvailable: true)

            controller.delegate = self

            self.present(controller, animated: false)
        }
    }
}

extension InvestmentTableViewController: ButtonCellDelegate
{
    func onAction()
    {
        showAlert(title: "Filipe Oliveira", message: "Investimento feito com sucesso ;)")
    }
}

class InvestmentTableViewController: UITableViewController
{
    @IBOutlet var tryAgainButton: UIButton!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    private var model: InvestmentScreen?
    {
        didSet
        {
            self.tableView.backgroundView = nil
            
            self.navigationItem.rightBarButtonItem?.isEnabled = model != nil
        }
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem)
    {
        if let image = self.tableView.screenshot(correctionValue: 70)
        {
            let controller: UIActivityViewController = .init(activityItems: [image], applicationActivities: nil)
            
            self.present(controller, animated: true)
        }
    }
    
    @IBAction func reloadAction()
    {
        Server_Request()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Remove linha navigationBar
        self.navigationController?.navigationBar.backIndicatorImage = .init()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = .init()
        
        reloadAction()
    }
    
//    override func viewDidAppear(_ animated: Bool)
//    {
//        super.viewDidAppear(animated)
//        
//        reloadAction()
//    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        var numberOfSections = 0
        
        // Verifica se as estruturas possuem dados e exibe o que de fato existe
        
        if model != nil
        {
            numberOfSections = 2 // StaticInfoCell + ButtonCell
        }
        
        if model?.screen?.info != nil
        {
            numberOfSections += 1 // + InfoCell
        }
        
        if model?.screen?.downInfo != nil
        {
            numberOfSections += 1 // + DownInfoCell
        }
        
        return numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Verifica se as estruturas possuem dados e corrige o que é para ser exibido
        
        if section == 0
        {
            return 1
        }
        
        if section == 1
        {
            if model?.screen?.info != nil
            {
                return model?.screen?.info?.count ?? 0
            }
            
            if model?.screen?.downInfo != nil
            {
                return model?.screen?.downInfo?.count ?? 0
            }
            
            return 1
        }
        
        if section == 2
        {
            if model?.screen?.info != nil && model?.screen?.downInfo != nil
            {
                return model?.screen?.downInfo?.count ?? 0
            }
            
            return 1
        }
        
        if section == 3
        {
            return 1
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Verifica se as estruturas possuem dados e corrige o que é para ser exibido - mesma lógica do numberOfRowsInSection só que aqui cuidamos da contrução da cell
        
        if indexPath.section == 0
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StaticInfoCell", for: indexPath) as? InvestmentStaticInfoTableViewCell, let model = model else
            {
                return .init()
            }
            
            cell.applyContent(model)
            
            return cell
        }
        else if indexPath.section == 1
        {
            if let model = model?.screen?.info?[indexPath.row]
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InvestmentInfoTableViewCell else
                {
                    return .init()
                }
                
                cell.applyContent(name: model.name, data: model.data)
                
                return cell
            }

            if let model = model?.screen?.downInfo?[indexPath.row]
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DownInfoCell", for: indexPath) as? InvestmentDownInfoTableViewCell else
                {
                    return .init()
                }
                
                cell.applyContent(name: model.name, data: model.data)
                cell.delegate = self
                
                return cell
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonTableViewCell else
            {
                return .init()
            }
            
            cell.delegate = self
            
            return cell
        }
        else if indexPath.section == 2
        {
            if let downInfoModel = model?.screen?.downInfo?[indexPath.row], model?.screen?.info != nil
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DownInfoCell", for: indexPath) as? InvestmentDownInfoTableViewCell else
                {
                    return .init()
                }
                
                cell.applyContent(name: downInfoModel.name, data: downInfoModel.data)
                cell.delegate = self
                
                return cell
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonTableViewCell else
            {
                return .init()
            }
            
            cell.delegate = self
            
            return cell
        }
        else if indexPath.section == 3
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonTableViewCell else
            {
                return .init()
            }
            
            cell.applyContent(text: "Investir")
            cell.delegate = self
            
            return cell
        }
        
        return .init()
    }
    
    private func Server_Request()
    {
        model = nil
        
        tableView.reloadData()
        
        if #available(iOS 10.0, *)
        {
            if let refreshControl = tableView.refreshControl, !refreshControl.isRefreshing
            {
                tableView.backgroundView = indicatorView
            }
        }
        else
        {
            tableView.backgroundView = indicatorView
        }
        
        SantanderApiClient.request(operation: .investiment) { (response: Result<InvestmentScreen,NSError>) in
            
            DispatchQueue.main.async {
                
                if #available(iOS 10.0, *)
                {
                    self.tableView.refreshControl?.endRefreshing()
                }
                
                switch response
                {
                    case .success(let result):
                        
                        self.model = result
                        
                        // Teste para dados divergentes do Servidor
//                        self.model?.screen?.risk = 6
//                        self.model?.screen?.moreInfo = nil
//                        self.model?.screen?.downInfo = nil
//                        self.model?.screen?.info = nil
        
                        self.tableView.reloadData()
                    
                    case .failure(_):
                        
                        self.tableView.backgroundView = self.tryAgainButton
                    
                }
                
            }
            
        }
    }
    
    private func showAlert(title: String, message: String?)
    {
        let controller: UIAlertController = .init(title: title, message: message, preferredStyle: .alert)
        controller.addAction(.init(title: "OK", style: .default))
        controller.view.tintColor = .red
        
        self.present(controller, animated: true)
    }
}
