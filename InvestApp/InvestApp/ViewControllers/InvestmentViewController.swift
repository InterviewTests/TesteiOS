//
//  InvestmentViewController.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import RxSwift

class InvestmentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fundNameLabel: UILabel!
    
    @IBOutlet weak var whatIsLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var riskTitleLabel: UILabel!
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet weak var monthFoundLabel: UILabel!
    
    @IBOutlet weak var monthCDILabel: UILabel!
    
    @IBOutlet weak var yearFoundLabel: UILabel!
    
    @IBOutlet weak var yearCDILabel: UILabel!
    
    @IBOutlet weak var twelveFoundLabel: UILabel!
    
    @IBOutlet weak var twelveCDILabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var risk1Constraint: NSLayoutConstraint!
    @IBOutlet weak var risk2Constraint: NSLayoutConstraint!
    @IBOutlet weak var risk3Constraint: NSLayoutConstraint!
    @IBOutlet weak var risk4Constraint: NSLayoutConstraint!
    @IBOutlet weak var risk5Constraint: NSLayoutConstraint!
    
    @IBOutlet weak var risk1Label: UILabel!
    
    @IBOutlet weak var risk2Label: UILabel!
    
    @IBOutlet weak var risk3Label: UILabel!
    
    @IBOutlet weak var risk4Label: UILabel!
    
    @IBOutlet weak var risk5Label: UILabel!
    
    @IBOutlet weak var infoTableHeighConstraint: NSLayoutConstraint!

    @IBOutlet weak var scrollView: TPKeyboardAvoidingScrollView!
    
    let viewModel = InvestmentViewModel()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setupObservables()
        viewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = self.scrollView.subviews[0].frame.size
        self.scrollView.contentSize = CGSize.init(width: size.width, height: size.height + 200)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        self.infoTableView.separatorStyle = .none
        self.infoTableView.dataSource = self
        FormViewCreator.changeButtonStyle(self.investButton)

        let tabBar = self.tabBarController!.tabBar
        tabBar.barTintColor = UIColor.appPrimaryColor()
        self.setUpIcons()
    }
    
    func setUpIcons() {
        self.risk1Label.text = "\u{f107}"
        self.risk2Label.text = "\u{f107}"
        self.risk3Label.text = "\u{f107}"
        self.risk4Label.text = "\u{f107}"
        self.risk5Label.text = "\u{f107}"
        self.risk1Label.isHidden = true
        self.risk2Label.isHidden = true
        self.risk3Label.isHidden = true
        self.risk4Label.isHidden = true
        self.risk5Label.isHidden = true
    }
    
    func setupObservables() {
        viewModel.investData.asObservable().subscribe(onNext: { (investData) in
            self.setUpData(investData?.screen)
        }).disposed(by: disposeBag)
    }
    
    func setUpCIDInfo(_ cdi: InvestCDI?, cdiLabel: UILabel, foundLabel: UILabel) {
        if let fund = cdi?.fund {
            foundLabel.text = String(format: "%.2f", fund) + "%"
        }
        if let CDI = cdi?.CDI {
            cdiLabel.text = String(format: "%.2f", CDI) + "%"
        }
    }
    
    func setUpData(_ data: InvestData?) {
        self.titleLabel.text  = data?.title
        
        self.fundNameLabel.text  = data?.fundName
        
        self.whatIsLabel.text  = data?.whatIs
        
        self.definitionLabel.text  = data?.definition
        
        self.riskTitleLabel.text  = data?.riskTitle
        
        self.infoTitleLabel.text  = data?.infoTitle
        
        self.setUpCIDInfo(data?.moreInfo?.month,
                          cdiLabel: self.monthCDILabel,
                          foundLabel: self.monthFoundLabel)
        
        self.setUpCIDInfo(data?.moreInfo?.year,
                          cdiLabel: self.yearCDILabel,
                          foundLabel: self.yearFoundLabel)
        
        self.setUpCIDInfo(data?.moreInfo?.twelvemonths,
                          cdiLabel: self.twelveCDILabel,
                          foundLabel: self.twelveFoundLabel)
        self.setUpRisk(data?.risk)
        self.infoTableHeighConstraint.constant = CGFloat(self.getInfoCount())*30.0
        self.infoTableView.reloadData()
    }
    
    func setUpRisk(_ value: Int?) {
        
        if let risk = value {
            if risk == 1 {
                _ = self.risk1Constraint.setMultiplier(multiplier: self.risk1Constraint.multiplier*2)
                self.risk1Label.isHidden = false
            } else if risk == 2 {
                _ = self.risk2Constraint.setMultiplier(multiplier: self.risk2Constraint.multiplier*2)
                self.risk2Label.isHidden = false
            } else if risk == 3 {
                _ = self.risk3Constraint.setMultiplier(multiplier: self.risk3Constraint.multiplier*2)
                self.risk3Label.isHidden = false
            } else if risk == 4 {
                _ = self.risk4Constraint.setMultiplier(multiplier: self.risk4Constraint.multiplier*2)
                self.risk4Label.isHidden = false
            } else if risk == 5 {
                _ = self.risk5Constraint.setMultiplier(multiplier: self.risk5Constraint.multiplier*2)
                self.risk5Label.isHidden = false
            }
        }
    }
    
    func getInfoCount() -> Int {
        var count = 0

        if let investData = self.viewModel.investData.value?.screen {
            if let info = investData.info {
                count += info.count
            }
            if let info = investData.downInfo {
                count += info.count
            }
        }
        
        return count
    }
    
    @objc func userDidTapDownload(tap: UITapGestureRecognizer) {
        UIApplication.shared.openURL(URL(string: "https://www.google.com")!)
    }
}

extension InvestmentViewController : UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getInfoCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var items = [InvestItemInfo]()
        var firstDown = 0
        if let investData = self.viewModel.investData.value?.screen {
            if let info = investData.info {
                items.append(contentsOf: info)
                firstDown = info.count
            }
            if let info = investData.downInfo {
                items.append(contentsOf: info)
            }
        }

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvestInfo") as? InvestInfoCellTableViewCell ?? InvestInfoCellTableViewCell.init(style: .default, reuseIdentifier: "InvestInfo")
        cell.infoLabel.text = items[indexPath.row].name

        if indexPath.row >= firstDown {
            cell.infoValueLabel.font = UIFont.fontAwesome(ofSize: 13)
            cell.infoValueLabel.text = "\u{f019}" + " Baixar"
            cell.infoValueLabel.textColor = UIColor.appPrimaryColor()
            cell.infoValueLabel.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userDidTapDownload(tap:)))
            cell.infoValueLabel.addGestureRecognizer(tapGesture)
        } else {
            cell.infoValueLabel.font = monthFoundLabel.font
            cell.infoValueLabel.text = items[indexPath.row].data
            cell.infoValueLabel.textColor = UIColor.darkGray
            cell.infoValueLabel.isUserInteractionEnabled = false

        }
        
        return cell
    }

}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

